class Api::V1::TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :update, :destroy]

  # GET /tutorials
  # GET /tutorials.json
  def index
    @tutorials = Tutorial.all
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = Tutorial.new(tutorial_params)

    if @tutorial.save
      render :show, status: :created, location: @tutorial
    else
      render json: @tutorial.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tutorials/1
  # PATCH/PUT /tutorials/1.json
  def update
    if @tutorial.update(tutorial_params)
      render :show, status: :ok, location: @tutorial
    else
      render json: @tutorial.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorial_params
      params.fetch(:tutorial, {})
    end
end
