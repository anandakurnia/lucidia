class ApplicationController < ActionController::API
  def require_login
    puts "penah ada rasa cinta antara kita kini tinggal kenangang"
    @credential = $redis.get(request.authorization)

    if (@credential == nil)
      return render json: { :message => "not authenticated" }, status: 401
    end

    $authentication = Patient.find(@credential)
  end
end
