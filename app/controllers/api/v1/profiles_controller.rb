class Api::V1::ProfilesController < ApplicationController
  before_action :authenticate_request
  skip_before_action :authenticate_request, only: [:activity]

  def show
    @user = User.find_by_username(params[:username])
  end

  def activity
    @tutorials = Tutorial.all
    @tutorials = @tutorials.upvoted_by(params[:upvoted]) if params[:upvoted].present?
    @tutorials = @tutorials.submitted_by(params[:submitted]) if params[:submitted].present?

    @tutorials = @tutorials.order('created_at DESC')

    render '/api/v1/profiles/activity', locals: { tutorial: @tutorials }
  end
end
