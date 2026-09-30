require "test_helper"

class AuthenticationFlowTest < ActionDispatch::IntegrationTest
  test "a visitor can sign up, log out, and log back in" do
    assert_difference("User.count", 1) do
      post user_registration_path, params: {
        user: {
          email: "new-user@example.com",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_redirected_to root_path
    follow_redirect!
    assert_includes response.body, "new-user@example.com"

    delete destroy_user_session_path
    assert_redirected_to root_path

    post user_session_path, params: {
      user: { email: "new-user@example.com", password: "password123" }
    }

    assert_redirected_to root_path
    follow_redirect!
    assert_includes response.body, "new-user@example.com"
  end
end
