source 'https://rubygems.org'
ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets

gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets

gem 'coffee-rails', '~> 4.1.0' # Use CoffeeScript for .coffee assets and views

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails' # Use jquery as the JavaScript library

# Turbolinks makes following links in your web application
# faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'twitter-bootstrap-rails'
gem 'browserify-rails'
gem 'simple_form'
gem 'less-rails'
gem 'rails-i18n'

group :development, :test do
  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'annotate'
  gem 'rspec-rails'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'
  gem 'guard-rspec', require: false
  gem 'bullet'
  gem 'rack-mini-profiler'
  gem 'fuubar'
  gem 'database_cleaner'
  gem 'ffaker'
  gem 'timecop'
  gem 'factory_girl_rails', require: false
  gem 'thin'
end

group :development do
  gem 'sqlite3' # Use sqlite3 as the database for Active Record

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  gem 'better_errors'
  gem 'brakeman', require: false
  gem 'rails_best_practices'
  gem 'rails-erd'
end

group :test do
  gem 'shoulda'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'simplecov-rcov'
end

group :production do
  gem 'rails_12factor'
  gem 'puma'
end
