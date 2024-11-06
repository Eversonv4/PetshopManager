require 'rails_helper'

RSpec.describe "Animals", type: :request do
  describe "GET /animals" do
    context "usuário não deve acessar sem estar autenticado" do
      it "usuário não deve acessar sem estar autenticado" do
        get "/animals"
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
