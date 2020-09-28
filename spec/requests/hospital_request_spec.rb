require "rails_helper"

RSpec.describe "Hospitals", type: :request do
  describe "test create get all hospital api" do
    it "has a 200 status code " do
      get "/api/v1/hospitals"
      expect(response.status).to eq(200)
    end
  end
end
