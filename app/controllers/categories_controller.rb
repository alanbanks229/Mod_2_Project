class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  #implement a like system? or sort by new?
  def show
    @category = Category.find(params[:id])
    @post = @category.posts
  end

  def new
    @category = Category.new
  end

  #haven't tested this out yet... delete comment if it works
  def create
    @category = Category.new(category_params)
    if @category.valid?
      @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  private
  def category_params
    params.require(:category).permit(:name, :description)
  end
end

# def new
#   @user = User.new
# end

# def create
#   @user = User.new(user_params)
#   if @user.valid?
#     @user.save
#     redirect_to user_path(@user)
#   else
#     render :new  
#   end
# end