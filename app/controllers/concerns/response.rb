module Response 
  
  def json_response(object, status = :ok, message= nil)
    render json: object, status: status, message: message
  end

end
