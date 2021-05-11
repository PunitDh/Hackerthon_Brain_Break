require 'rails_helper'

RSpec.describe "Twilios", type: :request do
  describe "GET /sms" do
    it "returns http success" do
      get "/twilio/sms"
      expect(response).to have_http_status(:success)
    end
  end

end
