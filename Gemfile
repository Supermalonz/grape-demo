source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.6"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.3"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
# gem "jbuilder"
# Add grape
gem 'grape', '~> 1.6', '>= 1.6.2'
# Add grape-swagger
gem 'grape-swagger', '~> 1.4', '>= 1.4.2'
# Add Serializers
gem 'active_model_serializers', '~> 0.10.13'
# Add Rswag
gem 'rswag-ui', '~> 2.5', '>= 2.5.1' # rails g rswag:ui:install
# Add sidekig
gem 'sidekiq', '~> 6.4', '>= 6.4.2'
#Add pry
gem 'pry', '~> 0.14.1'
#Add redis
gem 'redis', '~> 4.6'
#Add dotenv
gem 'dotenv', '~> 2.7', '>= 2.7.6'
# Add CSV reader
gem 'smarter_csv', '~> 1.6', '>= 1.6.1'

gem 'selenium-webdriver', '~> 4.1'
# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem "rack-cors"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

