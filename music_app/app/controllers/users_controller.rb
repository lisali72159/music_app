class UsersController < ApplicationController
  def new 
    @user = User.new
  end

  def create
    # debugger
    user = User.new(user_params)
    # debugger
    if user.save
      login_user!(user)
      redirect_to user_url(user)
    else 
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def show
    # debugger
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end