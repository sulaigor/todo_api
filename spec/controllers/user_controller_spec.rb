require 'rails_helper'

RSpec.describe UserController, type: :controller do

  describe "GET #show" do
    it "returns http 401" do
      get :show
      expect(response).to have_http_status(401)
    end
  end

  describe "POST #create" do
    it "returns http 401" do
      post :create
      expect(response).to have_http_status(401)
    end
  end

  describe "PUT #update" do
    it "returns http 401" do
      put :update
      expect(response).to have_http_status(401)
    end
  end

  describe "DELETE #destroy" do
    it "returns http 401" do
      delete :destroy
      expect(response).to have_http_status(401)
    end
  end

end
