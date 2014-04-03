ENV['RACK_ENV'] = 'test'

require_relative '../fresh_popcorn_app.rb'

# recursively require all model files
Dir[Dir.pwd + "/models/**/*.rb"].each { |f| require f }

require 'rack/test'
require 'rspec'
require 'capybara/rspec'
require 'factory_girl'
require 'faker'

FactoryGirl.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
FactoryGirl.find_definitions

RSpec.configure do |config|
  config.include Rack::Test::Methods

  def app() FreshPopcornApp end

  Capybara.app = app
end
