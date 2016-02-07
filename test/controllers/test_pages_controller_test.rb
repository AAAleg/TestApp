require 'test_helper'

class TestPagesControllerTest < ActionController::TestCase
  test "should get test_all" do
    get :test_all
    assert_response :success
  end

  test "should get test_auth" do
    get :test_auth
    assert_response :success
  end

end
