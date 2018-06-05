class Api::V1::AuthenticationController < ApplicationController
  def authenticate
    command = AuthenticateUser.call(auth_params[:email], auth_params[:password])

    if command.success?
      user = User.find(Auth.decode(command.result)[:user_id])
      render '/api/v1/auth/show', locals: { user: user, auth_token: command.result }
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  private
    def auth_params
      params.require(:auth).permit(:email, :password)
    end
end
