class Api::V1::FrameworksController < ApplicationController
  before_action :set_framework, only: [:show, :update, :destroy]

  def index
    @frameworks = Framework.all
  end

  def show
  end

  def create
    @framework = Framework.new(framework_params)

    if @framework.save
      render :show, status: :created
    else
      render json: @framework.errors, status: :unprocessable_entity
    end
  end

  def update
    if @framework.update(framework_params)
      render :show, status: :ok

    else
      render json: @framework.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @framework.destroy
  end

  private
    def set_framework
      @framework = Framework.find(params[:id])
    end

    def framework_params
      params.require(:framework).permit(:title, :description)
    end
end
