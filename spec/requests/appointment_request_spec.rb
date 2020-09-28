require "rails_helper"

RSpec.describe "Appointments", type: :request do
  describe "test create appointment api" do
    it "has a 200 status code" do
      @patient = Patient.create({
        id: 1,
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

      @doctor = Doctor.create({
        id: 1,
        name: "Dr. Anantasia",
      })

      @hospital = Hospital.create({
        id: 1,
        name: "Rs Patih Rapih",
        address: "Yogyakarta",
      })

      @schedule = Schedule.create({
        id: 1,
        hospital_id: @hospital.id,
        doctor_id: @doctor.id,
        time: Time.now + 40.minutes,
      })

      @response = JSON.parse(response.body)

      @payload = {
        schedule_id: @schedule.id,
      }

      @headers = { "Authorization" => @response["token"], "CONTENT_TYPE" => "application/json" }
      post "/api/v1/appoinments", :params => @payload.to_json(), :headers => @headers
      expect(response.status).to eq(200)
    end

    it "fails booking more than 10 patients on one doctor" do
      @patient = Patient.create({
        id: 1,
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

      @doctor = Doctor.create({
        id: 1,
        name: "Dr. Anantasia",
      })

      @hospital = Hospital.create({
        id: 1,
        name: "Rs Patih Rapih",
        address: "Yogyakarta",
      })

      @schedule = Schedule.create({
        id: 1,
        hospital_id: @hospital.id,
        doctor_id: @doctor.id,
        time: Time.now,
      })

      Appointment.create([
        {
          patient_id: 1,
          schedule_id: 1,
        },
        {
          patient_id: 2,
          schedule_id: 1,
        },
        {
          patient_id: 3,
          schedule_id: 1,
        },
        {
          patient_id: 4,
          schedule_id: 1,
        },
        {
          patient_id: 5,
          schedule_id: 1,
        },
        {
          patient_id: 6,
          schedule_id: 1,
        },
        {
          patient_id: 7,
          schedule_id: 1,
        },
        {
          patient_id: 8,
          schedule_id: 1,
        },
        {
          patient_id: 9,
          schedule_id: 1,
        },
        {
          patient_id: 10,
          schedule_id: 1,
        },
      ])

      @response = JSON.parse(response.body)

      @payload = {
        schedule_id: @schedule.id,
      }

      @headers = { "Authorization" => @response["token"], "CONTENT_TYPE" => "application/json" }
      post "/api/v1/appoinments", :params => @payload.to_json(), :headers => @headers
      expect(response.status).to eq(422)
    end

    it "fails booking appointment within 30 minutes before schedule time" do
      @patient = Patient.create({
        id: 1,
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

      @doctor = Doctor.create({
        id: 1,
        name: "Dr. Anantasia",
      })

      @hospital = Hospital.create({
        id: 1,
        name: "Rs Patih Rapih",
        address: "Yogyakarta",
      })

      @schedule = Schedule.create({
        id: 1,
        hospital_id: @hospital.id,
        doctor_id: @doctor.id,
        time: Time.now,
      })

      @response = JSON.parse(response.body)

      @payload = {
        schedule_id: @schedule.id,
      }

      @headers = { "Authorization" => @response["token"], "CONTENT_TYPE" => "application/json" }
      post "/api/v1/appoinments", :params => @payload.to_json(), :headers => @headers
      expect(response.status).to eq(422)
    end
  end
end
