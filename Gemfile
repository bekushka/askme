source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'uglifier'
gem 'jquery-rails'
gem 'rails-i18n', '~> 6.0.0'
gem 'webpacker', '~> 4.0'
gem 'bootsnap', '>= 1.4.2', require: false

group :production do
  gem 'pg', '~> 0.21'
end


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
    #gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'sqlite3', '~> 1.4'
  gem 'web-console', '~> 2.0'
    #gem 'listen', '~> 3.2'
end

