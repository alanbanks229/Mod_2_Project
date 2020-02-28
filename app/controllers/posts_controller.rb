class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(params[:id])
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@user)
  end

  def post_params
    params.require(:post).permit(:category_id, :user_id, :content, :title)
  end
end
