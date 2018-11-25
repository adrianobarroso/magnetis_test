source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.2'
gem 'bootstrap-sass', '~> 3.3'
gem 'jquery-rails'
gem 'devise'
gem 'simple_form'
gem 'pry'
gem "rack", ">= 2.0.6"
gem "loofah", ">= 2.2.3"
gem "rails-html-sanitizer", ">= 1.0.4"

group :development, :test do
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
