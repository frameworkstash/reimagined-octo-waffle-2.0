class Api::V1::LikesController < ApplicationController
  include SessionsHelper

  before_action :authenticate, only: [:create, :destroy]
  before_action :set_like_tutorial

  def create
    @like = @tutorial.likes.build

    if @like.save
      render :show, status: :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @like = @tutorial.likes.find(params[:id])
    @like.destroy
  end

  private
    def set_like_tutorial
      @tutorial = Tutorial.find(params[:tutorial_id])
    end
end
