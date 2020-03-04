class PostsController < ApplicationController
  
  before_action :authorized, only: [:new, :create, :edit, :update]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    current_user
    @post = Post.new

    if params[:category_id]
      @category_id = params[:category_id]
      @category_name = params[:category_name]
    end


  end

  # params we are getting  {"category" => int, "user" => int, ... } 
  #           needs to be {"category_id" => int, "user_id" => int...}
  # Can't find way to change post params :category, :user keys with '_id' after without
  # it breaking... ask Monday.
  def create
    # @post = Post.new(category_id: params[:post][:category],
    #                  user_id: params[:post][:user],
    #                  content: params[:post][:content],
    #                  title: params[:post][:title])
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.valid?
       @post.save
       redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

  end

  #not using this for now... save this tho.
  def post_params
    params.require(:post).permit(:category_id, :user_id, :content, :title)
  end
end
