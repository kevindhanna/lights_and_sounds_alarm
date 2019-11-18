Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://redis:6379/12' } if ENV['RAILS_ENV'] = 'production'
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://redis:6379/12' } if ENV['RAILS_ENV'] = 'production'
end