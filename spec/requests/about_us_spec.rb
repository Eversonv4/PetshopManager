require 'rails_helper'

RSpec.describe "AboutUs", type: :request do
  describe "GET /about-us" do
    context "usuário consegue acessar a página com informações sobre a empresa" do
      it "returns a 200 status" do
        get "/about-us"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
