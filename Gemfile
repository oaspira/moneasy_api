source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.2.1"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.5"
gem "pg_search"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use Jbuilder for building JSON APIs [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use JB for fast JSON rendering in Rails [https://github.com/amatsuda/jb]
gem "jb"

# Use Redis adapter to run Action Cable in production
# gem "redis", ">= 4.0.1"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin Ajax possible
# gem "rack-cors"

# Policy gem for authorization [https://github.com/varvet/pundit]
gem "pundit"

# File attachments gem [https://github.com/shrinerb/shrine]
# gem "shrine"

# Add Pry and Pry-Rails for debugging
gem "pry"
gem "pry-rails"

# Devise
gem "devise"

# Money
gem "money"

group :development, :test do
  gem "debug", platforms: %i[mri mingw mswin x64_mingw], require: "debug/prelude"
  gem "rspec-rails", "~> 6.0"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
  gem "annotate" # Annotate Rails classes with schema info
  gem "rails-erd" # Generate entity-relationship diagrams for Rails applications
  gem "factory_bot_rails" # Add FactoryBot for fixture replacement
  gem "faker"
end
