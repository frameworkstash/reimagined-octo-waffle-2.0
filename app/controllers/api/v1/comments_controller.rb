class Api::V1::CommentsController < ApplicationController
  skip_before_action :authenticate_request
  before_action :set_comment_tutorial

  def create
    @comment = @tutorial.comments.build(comment_params)

    if @comment.save
      render :show, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update
    @comment = @tutorial.comments.find(params[:id])

    if @comment.update(comment_params)
      render :show, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = @tutorial.comments.find(params[:id])
    @comment.destroy
  end

  private
    def set_comment_tutorial
      @tutorial = Tutorial.find(params[:tutorial_id])
    end

    def comment_params
      params.require(:comment).permit(:content)
    end
end
