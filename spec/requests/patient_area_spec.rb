require 'rails_helper'

RSpec.describe "PatientAreas", type: :request do
  describe "GET /patient_area" do
    context "quando o usuário não está autenticado" do
      it "redireciona para a página de login" do
        get "/patient_area"
        expect(response).to have_http_status(:found)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
