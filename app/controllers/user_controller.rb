class UserController < ApplicationController
  def index
    @users = User.all
  end

  def create
  User.create(user_params)
   redirect_to root_path
  end

  def edit
  end

  def update
  end

  def new
    @user = User.new
  end

  def destroy
  end

  def show
    @user = User.find(params[:id]) #This works!
  end

  def user_params
   params.require(:user).permit(:name, :email, :password)
  end
end
