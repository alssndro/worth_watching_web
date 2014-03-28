require 'test_helper'

class  MyAppTest < MiniTest::Test
  
  include Rack::Test::Methods

  def app
    App
  end

  def test_something_in_app
    assert_equal true, true
  end

  def test_homepage
    get '/'
    assert last_response.ok?
    puts last_response.body
  end
end