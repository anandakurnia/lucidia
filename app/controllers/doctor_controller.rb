class DoctorController < ApplicationController
  def getAll
    doctors = Doctor.includes(:hospitals).all

    render json: {
      data: doctors.as_json(include: [:hospitals]),
    }
  end
end
