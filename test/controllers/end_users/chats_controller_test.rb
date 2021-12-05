require "test_helper"

class EndUsers::ChatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_users_chats_index_url
    assert_response :success
  end

  test "should get show" do
    get end_users_chats_show_url
    assert_response :success
  end
end
