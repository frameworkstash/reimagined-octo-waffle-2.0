class Api::V1::ProfilesController < ApplicationController
  before_action :authenticate_request

  def show
    @user = User.find_by_username(params[:username])
  end
end
