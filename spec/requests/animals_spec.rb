require 'rails_helper'

RSpec.describe "Animals", type: :request do
  describe "GET /animals" do
    it "returns a 400 status" do
      get "/animals"
      expect(response).to have_http_status(:not_found)
    end
  end
end
