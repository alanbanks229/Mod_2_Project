class UsersController < ApplicationController
  def index
    current_user = User.find_by_id(session[:current_user_id])
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      redirect_to user_path(@user)
    else
      render :new  
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end

  #make sure to implement unique username, email, full_name validations
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:full_name, :email, :username)
  end

end