source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.5.1'

gem 'actionview', '>= 5.1.6.2'
gem 'acts-as-taggable-on'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'carrierwave'
gem 'coffee-rails', '~> 4.2'
gem 'devise', '>= 4.7.1'
gem 'dropzonejs-rails'
gem 'figaro'
gem 'fog'
gem 'font-awesome-rails'
gem 'google-analytics-rails'
gem 'google-api-client'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'jquery-slick-rails'
gem 'kaminari'
gem 'meta-tags'
gem 'mysql2'
gem 'nokogiri', '>= 1.10.4'
gem 'puma', '~> 3.7'
gem 'rails', '~> 6.0'
gem 'rails-i18n'
gem 'redcarpet'
gem 'rmagick'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'
gem 'uglifier', '>= 1.3.0'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  gem 'bullet'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'factory_bot_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'rubocop', require: false
  gem 'selenium-webdriver'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
