class CommentsController < ApplicationController


  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
    @post = params[:post]
    
    if params[:parent_id]
      @parent_id = params[:parent_id]
    end
  end 

  def create
    @comment = Comment.new(comment_params)
    if @comment.valid?
       @comment.save
       redirect_to post_path(@comment.post)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to post_path(@comment.post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to users_path
  end

  private
  def comment_params
    params.require(:comment).permit(:post_id, :user_id, :content, :parent_id)
  end
end
