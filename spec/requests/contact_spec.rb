require 'rails_helper'

RSpec.describe "Contacts", type: :request do
  describe "GET /contact" do
    it "returns a 200 status" do
      get "/contact"
      expect(response).to have_http_status(:success)
    end
  end
end
