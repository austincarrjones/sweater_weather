require 'rails_helper'

RSpec.describe "User API", type: :request do
  describe "POST /api/v1/users" do
    it "creates a new user" do
      user_params = {
        email: "user1@test.com",
        password: "password",
        password_confirmation: "password"
      }

      post api_v1_users_path, params: user_params

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:created)
      user = User.last
      expect(user.email).to eq("user1@test.com")
      # expect(json[:data][:attributes][:api_key].to eq(user.api_key)
    end

    it "returns error if passwords don't match" do
      user_params = {
        email: "user1@test.com",
        password: "password",
        password_confirmation: "p"
      }

      post api_v1_users_path, params: user_params

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(json[:error_object][:password_confirmation]).to include("doesn't match Password")
    end

    it "returns error if email is taken" do
      User.create!(email: "user1@test.com", password: "password", password_confirmation: "password")
      user_params = {
        email: "user1@test.com",
        password: "password",
        password_confirmation: "password"
      }

      post api_v1_users_path, params: user_params

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(json[:error_object][:email]).to include("has already been taken")
    end
  end

  it "returns error if field missing" do
    user_params = {
      email: "user1@test.com"
    }

    post api_v1_users_path, params: user_params

    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to have_http_status(:unprocessable_entity)
    expect(json[:error_object][:password]).to include("can't be blank")
  end
end