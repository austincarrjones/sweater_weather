require 'rails_helper'

RSpec.describe "User API", type: :request do
  describe "POST /api/v1/sessions happy path" do
    it "creates a new user" do
      User.create!(email: "user1@test.com", password: "password", password_confirmation: "password")

      user_params = {
        email: "user1@test.com",
        password: "password"
      }

      post api_v1_sessions_path, params: user_params

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:created)
      user = User.last
      expect(user.email).to eq("user1@test.com")
      expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
    end
  end
  
  describe "POST /api/v1/sessions sad paths" do
    it "returns error if passwords don't match" do
      User.create!(email: "user1@test.com", password: "password", password_confirmation: "password")

      user_params = {
        email: "user1@test.com",
        password: "pass"
      }

      post api_v1_sessions_path, params: user_params

      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:unprocessable_entity)
      expect(json[:error_object][:password_confirmation]).to include("bad credentials")
    end
  end