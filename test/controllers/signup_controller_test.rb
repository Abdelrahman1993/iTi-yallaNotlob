require 'test_helper'

class SignupControllerTest < ActionDispatch::IntegrationTest
  test "should get signup" do
    get signup_signup_url
    assert_response :success
  end

end
