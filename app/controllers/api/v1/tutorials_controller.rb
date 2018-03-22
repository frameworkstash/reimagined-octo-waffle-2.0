class Api::V1::TutorialsController < ApplicationController
  before_action :set_tutorial, only: [:show, :update, :destroy, :upvote]
  before_action :set_tutorial_framework, only: [:create, :update]

  # GET /tutorials
  # GET /tutorials.json
  def index
    @tutorials = Tutorial.all.order('created_at DESC')
  end

  # GET /tutorials/1
  # GET /tutorials/1.json
  def show
  end

  # POST /tutorials
  # POST /tutorials.json
  def create
    @tutorial = @framework.tutorials.build(tutorial_params)

    if @tutorial.save
      render :show, status: :created
    else
      render json: @tutorial.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tutorials/1
  # PATCH/PUT /tutorials/1.json
  def update
    if @tutorial.update(tutorial_params)
      render :show, status: :ok
    else
      render json: @tutorial.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tutorials/1
  # DELETE /tutorials/1.json
  def destroy
    @tutorial.destroy
  end

  # POST /tutorials/1/upvote
  def upvote
    like = @tutorial.likes.build

    if like.save
      render '/api/v1/likes/tutorial', locals: { tutorial: @tutorial }
    else
      render json: like.errors, status: :unprocessable_entity
    end
  end

  private
    def set_tutorial
      @tutorial = Tutorial.find(params[:id])
    end

    def set_tutorial_framework
      @framework = Framework.find(params[:framework_id])
    end

    def tutorial_params
      params.require(:tutorial).permit(:title, :description, :website, :author, :skill_level, :framework_id)
    end
end
