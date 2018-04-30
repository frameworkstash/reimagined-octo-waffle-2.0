class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show]

  # GET /users/1
  # GET /tutorials/1.json
  def show
    render locals: {
      user: @user
    }
  end

  private
    def set_user
      @user = User.find(params[:id])
    end
end
