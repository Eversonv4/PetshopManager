require 'rails_helper'

RSpec.describe "Animals", type: :request do
  describe "GET /animals" do
    context "usuário acessa normalmente mesmo sem estar autenticado" do
      it "usuário acessa normalmente mesmo sem estar autenticado" do
        get "/animals"
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
