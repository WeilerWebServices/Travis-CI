require 'travis'

module Travis
  class Workers
    def setup
      Travis::Features.start

      Travis::Async.enabled = true
      Travis::Amqp.config = Travis.config.amqp
      # Travis::Memory.new(:workers).report_periodically if Travis.env == 'production'

      Travis::Exceptions::Reporter.start
      Travis::Notification.setup
      Travis::Addons.register

      Travis::Async::Sidekiq.setup(Travis.config.redis.url, Travis.config.sidekiq)
      # NewRelic.start if File.exists?('config/newrelic.yml')
    end

    def run
      run_periodically(Travis.config.workers.prune.interval, &::Worker.method(:prune))
      Travis::Amqp::Consumer.workers.subscribe(:ack => true, &method(:receive))
    end

    private

      def receive(message, payload)
        failsafe(message) do
          event = message.properties.type
          payload = MultiJson.decode(payload) || raise("no payload for #{event.inspect} (#{message.inspect})")
          Travis.uuid = payload.delete('uuid')
          handle(payload) if Travis::Features.feature_active?(:worker_updates)
        end
      end

      def handle(payload)
        # TODO hot compat, remove the next line once all workers send the new payload
        reports = payload.is_a?(Hash) ? payload['workers'] || payload : payload
        reports = [reports] if reports.is_a?(Hash)
        Travis.run_service(:update_workers, reports: reports)
      end

      def failsafe(message, options = {}, &block)
        Timeout::timeout(options[:timeout] || 60, &block)
      rescue Exception => e
        begin
          puts e.message, e.backtrace
          Travis::Exceptions.handle(e)
        rescue Exception => e
          puts "!!!FAILSAFE!!! #{e.message}", e.backtrace
        end
      ensure
        message.ack
      end
  end
end
