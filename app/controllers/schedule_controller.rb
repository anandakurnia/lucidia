class ScheduleController < ApplicationController
  before_action :require_login

  def getAll
    schedules = Schedule.includes(:doctor, :hospital, :patients).all

    return render json: { data: schedules.as_json(include: [:doctor, :hospital, :patients]) }
  end
end
