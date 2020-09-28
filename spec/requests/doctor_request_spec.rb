require "rails_helper"

RSpec.describe "Doctors", type: :request do
  describe "test create get all doctor api" do
    it "has a 200 status code " do
      get "/api/v1/doctors"
      expect(response.status).to eq(200)
    end
  end
end
