class DevSessionsController < ApplicationController
  
  def new
  end
  
  def create
    @developer = Developer.find_by(email: params[:dev_session][:email].downcase)
    if @developer && @developer.authenticate(params[:dev_session][:password])
      session[:developer_id] = @developer.id
      flash[:info] = "logged in as #{@developer.developername}"
      redirect_to @developer
    else
      flash[:danger] = 'invalid email/password combination'
      render 'new'
    end
  end
  
  def destroy
    session[:developer_id] = nil
    redirect_to root_path
  end
  
end
