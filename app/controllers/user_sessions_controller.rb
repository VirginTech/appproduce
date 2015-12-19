class UserSessionsController < ApplicationController
  
  def new
  end
  
  def create_sns_login
    #binding.pry
    @user=User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id]=@user.id
    flash[:info] = "logged in as #{@user.nickname}"
    redirect_to @user
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

  #=======================
  #SNSログインキャンセル
  #=======================
  def failure
    flash[:danger] = "認証に失敗しました。"
    redirect_to root_url
  end
  
end
