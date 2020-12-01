require 'sidekiq'
require 'sidekiq/web'
require 'travis/config'

module Travis
  class Config < Hashr
    define  sidekiq: { namespace: 'sidekiq', pool_size: 1, id: nil },
            redis:   { url: 'redis://localhost:6379' }
  end

  def self.config
    @config ||= Travis::Config.load
  end
end



if ENV['RACK_ENV'] != 'development'
  require 'rack/ssl'
  require 'travis/sso'
  Sidekiq::Web.session_secret = Travis.config.session_secret
  Sidekiq::Web.use Rack::SSL
  Sidekiq::Web.use Travis::SSO,
      endpoint:     Travis.config.api_endpoint,
      mode:         :session,
      authorized?:  -> u { Travis.config.admins.include? u['login'] }
  Sidekiq::Web.use Rack::Protection, use: :authenticity_token
end

Sidekiq.configure_client do |config|
  config.redis = Travis.config.redis.to_h.merge(size: 1, namespace: Travis.config.sidekiq.namespace, id: nil)
end

run Sidekiq::Web
