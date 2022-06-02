# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |_repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'
gem 'rails', '~> 7.0.3'

gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'grape', '~> 1.6', '>= 1.6.2'
gem 'grape-swagger', '~> 1.4', '>= 1.4.2'
gem 'active_model_serializers', '~> 0.10.13'
gem 'rswag-ui', '~> 2.5', '>= 2.5.1'
gem 'sidekiq', '~> 6.4', '>= 6.4.2'
gem 'pry', '~> 0.14.1'
gem 'redis', '~> 4.6'
gem 'dotenv', '~> 2.7', '>= 2.7.6'
gem 'smarter_csv', '~> 1.6', '>= 1.6.1'
gem 'selenium-webdriver', '~> 4.1'
gem 'tzinfo-data', platforms: %i[ mingw mswin x64_mingw jruby ]
gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'rspec-sidekiq', '~> 3.1'
  gem 'rspec-grape', '~> 0.0.4'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'shoulda-matchers', '~> 5.1'
  gem 'vcr', '~> 6.1'
  gem 'webmock', '~> 3.14'
end

group :development do
end
