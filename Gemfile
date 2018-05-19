source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'

# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Lois reports statuses of CI results to GitHub Pull Request Statuses
gem 'lois'

# A library for reading Microsoft Access databases
gem 'mdb'

# Facebook OAuth2 Strategy for OmniAuth
gem 'omniauth-facebook'

# Style guide
gem 'rubocop', require: false

group :development, :test do
  # Load environment variables
  gem 'dotenv-rails'
  # Debugger
  gem 'pry-byebug'
  # Debugger
  gem 'pry-rails'
  # Test runner
  gem 'rspec-rails'
end

group :test do
  # Acceptance test framework for web applications
  gem 'capybara'
  # A helper for launching cross-platform applications in a fire and forget manner
  gem 'launchy'
  # Code coverage
  gem 'simplecov', require: false
  # RSpec results formatted as JUnit XML
  gem 'rspec_junit_formatter'
end

group :development do
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end
