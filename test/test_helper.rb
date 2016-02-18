ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# require 'minitest/pride' # For output of color when running tests in the terminal

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def json(response_body)
    JSON.parse(response_body, symbolize_names: true)
  end
end
