require 'rails_helper'

RSpec.describe "Shops", type: :request do
  describe "GET /shop" do
    context "usuário consegue acessar a página de produtos" do
      it "returns a 200 status" do
        get "/shop"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
