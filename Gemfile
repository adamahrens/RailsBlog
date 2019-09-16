source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'annotate', '~> 2.7', '>= 2.7.5'
gem 'bcrypt', '~> 3.1.7'
gem 'coffee-rails', '~> 4.2'
gem 'faker', '~> 2.2', '>= 2.2.2'
gem 'jbuilder', '~> 2.5'
gem 'ordinare', '~> 0.4.0'
gem 'puma', '~> 3.11'
gem 'pundit', '~> 2.1'
gem 'purecss-sass', '~> 1.0', '>= 1.0.1'
gem 'rails', '~> 5.2.3'
gem 'sass-rails', '~> 5.0'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'meta_request', '~> 0.7.2'
  gem 'rb-readline', '~> 0.5.5'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
