require 'rails_helper'

RSpec.describe "AboutUs", type: :request do
  describe "GET /about-us" do
    it "returns a 200 status" do
      get "/about-us"
      expect(response).to have_http_status(:success)
    end
  end
end
