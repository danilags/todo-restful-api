module Response 
  
  def json_response(object, status = :ok)
    # logger.log "Setter for logging #{message}"
    render json: object, status: status, message: message
  end

end
