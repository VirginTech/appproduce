class UserSessionsController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.find_by(email: params[:user_session][:email].downcase)
    if @user && @user.authenticate(params[:user_session][:password])
      session[:user_id] = @user.id
      flash[:info] = "logged in as #{@user.nickname}"
      redirect_to @user
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
  
end
