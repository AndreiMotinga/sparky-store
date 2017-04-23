require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #contacts" do
    it "returns http success" do
      get :contacts
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #delivery" do
    it "returns http success" do
      get :delivery
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #catalogs" do
    it "returns http success" do
      get :catalogs
      expect(response).to have_http_status(:success)
    end
  end

end
