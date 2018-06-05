# class Api::V1::SessionsController < ApplicationController
#   def create
#     @user = User.where(uid: auth_params[:uid]).first_or_create! do |user|
#       user.displayName = auth_params[:displayName]
#       user.email = auth_params[:email]
#       # user.username = auth_params[:username]
#       user.providerId = auth_params[:providerId]
#       user.photoURL = auth_params[:photoURL]
#     end
#     if @user
#       @jwt = Auth.issue({ user: @user.id })
#       render '/api/v1/users/show', locals: { user: @user, jwt: @jwt }
#     end
#   end
#
#   private
#     def auth_params
#       params.require(:auth).permit(:displayName, :email, :providerId, :photoURL, :uid)
#     end
# end
