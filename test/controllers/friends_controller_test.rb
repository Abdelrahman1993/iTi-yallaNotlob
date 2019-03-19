require 'test_helper'

class FriendsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get friends_view_url
    assert_response :success
  end

  test "should get add" do
    get friends_add_url
    assert_response :success
  end

end
