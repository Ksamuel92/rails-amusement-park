class UsersController < ApplicationController
  
  def new
  @user = User.new
    # byebug
  end

  def create
    if (user = User.create(user_params))
      user.save
      session[:user_id] = user.id
      # byebug
      redirect_to user_path(user)
    else
      render 'new'
    end
  end

  def show
    @user = User.find_by(id: session[:user_id])
  end

  def home

  end

  private
  
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :nausea, :happiness, :tickets, :height, :admin)
  end
end
