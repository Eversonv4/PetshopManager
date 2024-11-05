require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /" do
    context "usuário acessa normalmente mesmo sem estar autenticado" do
      it "returns a 200 status" do
        get "/"
        expect(response).to have_http_status(:success)
      end
    end
  end
end
