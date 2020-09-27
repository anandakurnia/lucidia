class DoctorController < ApplicationController
  def getAll
    doctors = Doctor.includes(:hospitals).all

    render json: doctors.to_json(:include => :hospitals)
  end
end
