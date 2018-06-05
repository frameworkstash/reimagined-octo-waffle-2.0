class ApplicationController < ActionController::API
  before_action :authenticate_request
  helper_method :signed_in?, :current_user
  attr_reader :current_user

  private
    def authenticate_request
      return if request.headers['Authorization'].blank?
      @current_user = AuthorizeApiRequest.call(request.headers).result
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end

    def current_user
      @current_user ||= super || User.find(@current_user.id)
    end

    def signed_in?
      @current_user.present?
    end
end
