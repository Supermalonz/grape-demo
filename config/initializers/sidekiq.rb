require 'sidekiq/middleware/i18n'
require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: $redis.id }
end

Sidekiq.configure_client do |config|
  config.redis = { url: $redis.id }
end

Sidekiq.strict_args!
