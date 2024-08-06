require 'rails_helper'

RSpec.describe "User API", type: :request do
  describe "POST /api/v1/users" do
    it "creates a new user" do
      user_params = {
        email: "user1@test.com",
        password: "password",
        password_confirmation: "password"
      }

      post api_v1_users_path, params: { user: user_params }
      expect(response).to have_http_status(:created)

      user = User.last
      expect(user.username).to eq("user1@test.com")
    end

    xit "returns an error if user is not created" do
      user_params = {
        username: "user1",
        email: ""
      }

      post api_v1_users_path, params: { user: user_params }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end