class Api::V1::UsersController < ApplicationController
  before_action :authenticate_request

  # GET /users/:username
  # GET /tutorials/1.json
  def show
    render '/api/v1/users/show', locals: { user: @current_user }
  end
end
