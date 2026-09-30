require "rails_helper"

RSpec.describe "Authentication", type: :request do
  describe "POST /users" do
    it "allows a visitor to sign up" do
      expect {
        post user_registration_path, params: {
          user: {
            email: "new-user@example.com",
            password: "password123",
            password_confirmation: "password123"
          }
        }
      }.to change(User, :count).by(1)

      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.body).to include("new-user@example.com")
    end
  end

  describe "POST /users/sign_in" do
    it "allows a user to log in" do
      user = User.create!(email: "user@example.com", password: "password123")

      post user_session_path, params: {
        user: { email: user.email, password: "password123" }
      }

      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.body).to include(user.email)
    end
  end

  describe "DELETE /users/sign_out" do
    it "allows a signed-in user to log out" do
      user = User.create!(email: "user@example.com", password: "password123")
      post user_session_path, params: {
        user: { email: user.email, password: "password123" }
      }

      delete destroy_user_session_path

      expect(response).to redirect_to(root_path)
      follow_redirect!
      expect(response.body).not_to include(user.email)
      expect(response.body).to include("ログイン")
    end
  end
end
