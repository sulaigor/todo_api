require 'rails_helper'

RSpec.describe TodoController, type: :controller do

  describe "GET #index" do
    it "returns http 401" do
      get :index
      expect(response).to have_http_status(401)
    end
  end

  describe 'POST #create' do
    it "returs http 401" do
      post :create
      expect(response).to have_http_status(401)
    end
  end

  # describe "GET #show" do
  #   it "returns http 401" do
  #     get :show
  #     expect(response).to have_http_status(401)
  #   end
  # end

  # describe 'PUT #update' do
  #   it "returs http 401" do
  #     put :update
  #     expect(response).to have_http_status(401)
  #   end
  # end

  # describe 'DELETE #destroy' do
  #   it "returs http 401" do
  #     delete :destroy
  #     expect(response).to have_http_status(401)
  #   end
  # end

end
