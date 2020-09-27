class AppointmentController < ApplicationController
  before_action :require_login

  def create
    @request = JSON.parse(request.body.read)

    @schedule = Schedule.includes(:doctor, :hospital, :patients).find(@request["schedule_id"])

    if (@schedule.doctor.appointments.count() >= 10)
      return render json: { message: "this schedule has reach maximum appoinment" }, status: 422
    end

    if ((@schedule.time.getlocal - Time.now.getlocal) < 1800)
      return render json: { message: "booking appointment can only done within 30 minutes before schedule time" }, status: 422
    end

    @schedule.appointments.create({
      patient_id: $authentication.id,
    })

    return render json: { data: @schedule }
  end
end
