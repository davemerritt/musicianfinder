source 'https://rubygems.org'
ruby '2.1.2'

  gem 'rails', '4.1.6'

  gem 'pg'
  gem 'pg_search' #full-text search for postgres

  gem 'sorcery'

  gem 'paperclip', '3.5.4'
  gem 'aws-sdk' #required for Amazon S3 paperclip
  gem "kaminari" #for pagination
  gem 'foundation-rails'

  gem 'geocoder'
  gem 'acts-as-taggable-on'

  gem 'sass-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'

  gem 'jquery-rails'
  gem 'jquery-ui-rails'

  gem 'unicorn'
 # gem 'jbuilder', '~> 1.2'
group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'spring'
  gem 'faker' #Used for seed data creation
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
  gem 'sunspot_solr'
  gem 'letter_opener'
end

group :development, :test do
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'guard-rspec'
end

group :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'simplecov', require: false
end

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end
