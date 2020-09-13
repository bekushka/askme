source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'uglifier'
gem 'jquery-rails'
gem 'rails-i18n', '~> 6.0.0'
# Use sqlite3 as the database for Active Record

group :production do
  gem 'pg'
end

# Use Puma as the app server
#gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'webpacker', '~> 4.0'
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'listen', '~> 3.2'
end

