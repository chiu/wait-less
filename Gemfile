source 'https://rubygems.org'
ruby '2.1.3'
gem 'rails', '4.2.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'pg'
gem 'rack-cors', :require => 'rack/cors'
gem 'twilio-ruby' 

gem 'dotenv-rails', :groups => [:development, :test]
gem 'dotenv-rails', :require => 'dotenv/rails-now'

group :development, :test do
  gem 'byebug'
end
group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem "pry"
  gem "pry-rails"
  gem "pry-nav"
end

gem 'bootstrap-sass'
gem 'devise'
gem 'pundit'
gem 'therubyracer', :platform=>:ruby

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_21]
  gem 'quiet_assets'
  gem 'rails_layout'
end
group :production do
  gem 'rails_12factor'
  gem 'puma', '2.11.1'
end