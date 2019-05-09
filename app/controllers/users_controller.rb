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
