class PatientController < ApplicationController
  def register
    @request = JSON.parse(request.body.read)

    if (Patient.where(email: @request["email"]).count() != 0)
      return render json: { message: "email has been registered" }, status: 401
    end

    @request["password"] = BCrypt::Password.create(@request["password"])

    patient = Patient.create(@request)

    return render json: { data: patient.as_json(except: [:password]) }, status: 200
  end

  def login
    @request = JSON.parse(request.body.read)

    @patient = Patient.where(email: @request["email"]).first

    if (@patient == nil)
      return render json: { message: "email not found" }, status: 401
    end

    if (BCrypt::Password.new(@patient.password) != @request["password"])
      return render json: { message: "wrong password" }, status: 401
    end

    @payload = { data: @patient.email + SecureRandom.hex }

    @token = token = JWT.encode @payload, nil, "none"

    $redis.set(@token, @patient.id)

    return render json: { data: @patient, token: @token }
  end

  def logout
    $redis.del(request.authorization)

    return render json: {}
  end
end
