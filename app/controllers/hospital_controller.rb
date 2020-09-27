class HospitalController < ApplicationController
  def getAll
    hospitals = Hospital.includes(:doctors).all

    render json: {
      data: hospitals.as_json(include: [:doctors]),
    }
  end
end
