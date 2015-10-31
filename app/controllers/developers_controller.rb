class DevelopersController < ApplicationController
  
  def show # 追加
    @developer = Developer.find(params[:id])
  end
  
  def new
    @developer = Developer.new
  end
  
  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @developer # ここを修正
    else
      render 'new'
    end
  end

  private

  def developer_params
    params.require(:developer).permit(:developername, :email, :password,
                                                                :password_confirmation)
  end
  
end
