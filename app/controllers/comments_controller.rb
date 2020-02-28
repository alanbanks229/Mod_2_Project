class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comments = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to comment_path(@comment)
  end

  def edit
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
