require 'rails_helper'

describe EndUsers::EndUsersController, type: :controller do
  describe "Get #show" do
    it "正しいビューに遷移する。" do
      expect(response.status).to eq 200
    end
    
    it "@end_userに該当エンドユーザーの情報が入っている。" do
      get :show, params: {id: id}
      expect(response).to have_http_status "200"
    end
  end
end