require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /" do
    context "usuário consegue acessa a página principal" do
      it "usuário consegue acessa a página principal" do
        get "/"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
