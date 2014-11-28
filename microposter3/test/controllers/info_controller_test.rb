require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get find_microposts" do
    get :find_microposts
    assert_response :success
  end

end
