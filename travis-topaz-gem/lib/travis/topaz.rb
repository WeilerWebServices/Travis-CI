require 'travis/topaz/version'
require 'logger'
require 'faraday'
require 'open-uri'

module Travis
  class Topaz
    attr_accessor :queue, :logger

    def initialize(url, logger = Logger.new($stdout))
      unless url
        @logger.info("No Topaz URL present")
        return
      end

      @url = url
      @logger = logger
      @logger.info("Setting up Topaz")
      @queue = ::SizedQueue.new(100)
      conn = Faraday.new

      Thread.new do
        loop do
          begin
            event = queue.pop
            @logger.info("Posting event to Topaz with the following data: #{event}")
            conn.post @url + '/event/new', event
          rescue => e
            @logger.info([e.message, e.backtrace].flatten.join("\n"))
          end
        end
      end

    rescue => e
      @logger.info([e.message, e.backtrace].flatten.join("\n"))
    end

    def update(event)
      return unless queue && queue.num_waiting < 100
      @logger.info("Pushing Topaz Event to queue: #{event}")
      queue.push(event)
    rescue => e
      @logger.info([e.message, e.backtrace].flatten.join("\n"))
    end

    def builds_provided_for(owner_id)
      url = @url + "/builds_provided/#{owner_id}"
      response = open(url).read
    rescue => e
      @logger.info([e.message, e.backtrace].flatten.join("\n"))
    end

  end
end
