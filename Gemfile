source "https://rubygems.org"

ruby "2.4.0"

gem "autoprefixer-rails"
gem "delayed_job_active_record"
gem "flutie"
gem "honeybadger"
gem "jquery-rails"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.0.0"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "skylight"
gem "sprockets", ">= 3.0.0"
gem "suspenders"
gem "title"
gem "uglifier"

group :development do
  gem "listen"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.5"
end

group :development, :staging do
  gem "rack-mini-profiler", require: false
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end

gem 'bourbon', '5.0.0.beta.6'
gem 'neat', '~> 1.8.0'
gem 'refills', group: [:development, :test]

## app-specific gems
# static pages
gem 'high_voltage'
# backend crud
gem 'rails_admin', '~> 1.1', '>= 1.1.1'
# model versioning and management
gem 'paper_trail', '~> 6.0', '>= 6.0.2'
# user model
gem 'devise', '~> 4.2'
gem 'omniauth-facebook', '~> 4.0'

# authorization
gem 'cancancan', '1.12'

# mailing messages
gem 'signet', '~> 0.7.3'

# connect with gmail as a webservice
gem 'json', '~> 2.0', '>= 2.0.3'
# gem 'google-api-client', '~> 0.9.26'#, require: 'google/api_client'
gem 'omniauth', '~> 1.4'
# gem 'omniauth-google-oauth2', '~> 0.4.1'
gem 'twilio-ruby', '~> 4.13'
# message tracking engine
gem 'mailboxer', '~> 0.14.0'
# autocomplete and other js goodies
gem 'jquery-ui-rails', '~> 5.0'
# file uploading
gem 'carrierwave', '~> 1.0'
gem 'mini_magick', '~> 4.6', '>= 4.6.1'
gem 'fog', '~> 1.38'

# nested attributes enhanced with jQuery
gem 'cocoon', '~> 1.2', '>= 1.2.9'

# date picker https://github.com/webbushka/pickadate.js
gem 'rails-assets-pickadate-sass', source: 'https://rails-assets.org'
# better UX with a select and jQuery
gem 'chosen-rails', '~> 1.5', '>= 1.5.2'
# Implement texter classes for sending SMS messages in similar way to how e-mails are sent with
# ActionMailer-based mailers.
gem 'textris', '~> 0.4.4'

# tagging for models like contacts
gem 'acts-as-taggable-on', '~> 4.0'