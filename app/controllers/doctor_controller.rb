class DoctorController < ApplicationController
  def getAll
    doctors = Doctor.includes(:hospitals).all

    return render json: { data: doctors.as_json(include: [:hospitals]) }
  end
end
