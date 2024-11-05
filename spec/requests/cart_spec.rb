require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "GET /cart/index" do
    context "usuário consegue acessar os produtos adicionados ao carrinho" do
      it "returns a 200 status" do
        get "/cart/index"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
