# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../spec/rails_app/config/environment", __FILE__)
require 'rspec/rails'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
# Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
# require 'support/helpers'
require 'netzke/testing'

# For JS tests change the cleaning strategy to truncation
require 'support/database_cleaner'
require File.expand_path(File.dirname(__FILE__) + '/capybara_config')
require 'capybara/rspec'
require 'capybara/rails'
require File.expand_path(File.dirname(__FILE__) + '/support/helpers')

RSpec.configure do |config|
  config.include Helpers

  Netzke::Testing.rspec_init(config)

  FactoryGirl.find_definitions

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"

  config.example_status_persistence_file_path = 'tmp/examples.txt'
end
