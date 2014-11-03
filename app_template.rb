# ------------------------------ #
# Add to Gemfile
# ------------------------------ #

## Use mysql as the database for Active Record
gem_group :development, :test do
  gem 'mysql2'
end
#gem_group :production do
#  gem 'pg'
#end

gem 'thin'

if yes?('Does this app use devise? (yes / no)')
  gem 'devise'
end

if yes?('Does this app use nokogiri? (yes / no)')
  gem 'nokogiri'
end


## Add testing tools
gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'fuubar', '~> 2.0.0.rc1'
  gem 'coveralls', :require => false
  gem 'simplecov'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "brakeman", :require => false
  gem "rails-erd"
end

# bundle install
run_bundle


# ------------------------------ #
# Set params for .gitignore
# ------------------------------ #

ignoreparams = <<-CODE
.rspec
/vendor/bundler
/coverage
/spec/tmp
CODE
File.open('.gitignore', 'a') do |file|
  file.write ignoreparams
end

# ------------------------------ #
# Set up RSpec
# ------------------------------ #
generate 'rspec:install'


# ------------------------------ #
# Execute command
# ------------------------------ #
run "mv README.rdoc README.md"




