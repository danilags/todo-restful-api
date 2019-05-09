# app/controllers/users_controller.rb
class UsersController < ApplicationController
  # POST /signup
  # return authenticated token upon signup
  # skip_before_action :authorize_request, only: :create
   
  def create 
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    puts "Created new user --> #{user}"
    response = { message: Message.account_created, auth_token: auth_token, status_code: 201 }
    json_response(response, :created)
  end

  # GET /users
  def index 
    begin
      users = User.all
      puts "Get All users"
      response = { message: Message.all_user, users: users, status_code: 200 }
      json_response(response, :ok, 'Success get all users')
    rescue Exception
      json_response({ message: 'Not Found', status_code: 404 }, :not_found, 'Not Found')
    end
  end

  private

  # strong parameter
  def user_params 
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
