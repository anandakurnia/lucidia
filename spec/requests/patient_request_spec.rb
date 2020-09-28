require "rails_helper"

RSpec.describe "Patients", type: :request do
  describe "test logout api" do
    it "has a 200 status code and successfully logout" do
      get "/api/v1/logout"
      expect(response.status).to eq(200)
    end
  end

  describe "test register api" do
    it "has a 200 status code" do
      @payload = {
        name: "test",
        email: "test@domain.com",
        password: "password",
      }

      @headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/register", :params => @payload.to_json(), :headers => @headers
      expect(response.status).to eq(200)
      expect(Patient.count()).to eq (1)
    end
  end

  describe "test login api" do
    it "has a 200 status code" do
      Patient.create({
        name: "test",
        email: "test@domain.com",
        password: "$2a$12$vluwbH418j7584yX8.VhWepoK.hH/mqdVUzfmHqmA84bBTG3hBbzi",
      })

      @payload = {
        email: "test@domain.com",
        password: "password",
      }

      @headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/login", :params => @payload.to_json(), :headers => @headers
      expect(response.status).to eq(200)
    end
  end
end
