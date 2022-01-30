require 'rails_helper'

RSpec.describe "EndUsers::Mysingers", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/end_users/mysingers/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/end_users/mysingers/create"
      expect(response).to have_http_status(:success)
    end
  end

end
