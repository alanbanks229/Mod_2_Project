class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def show
    @comment = Comment.find(params[:id])
  end
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to comment_path(@comment)
  end

  def edit
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to users_path
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
