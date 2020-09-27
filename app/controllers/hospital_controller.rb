class HospitalController < ApplicationController
  def getAll
    hospitals = Hospital.includes(:doctors).all

    render json: hospitals.to_json(:include => :doctors)
  end
end
