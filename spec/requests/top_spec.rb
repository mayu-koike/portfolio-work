require 'rails_helper'

RSpec.describe "Tops", type: :request do
  let(:user) { create(:user) }
  describe "GET /home" do
    before { sign_in user }
    it "returns http success" do
      get "/home"
      expect(response).to have_http_status(:success)
    end
  end
end
