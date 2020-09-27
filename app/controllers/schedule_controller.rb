class ScheduleController < ApplicationController
  def getAll
    schedules = Schedule.includes(:doctor, :hospital).all

    render json: {
      data: schedules.as_json(include: [:doctor, :hospital]),
    }
  end
end
