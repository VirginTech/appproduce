class DevelopersController < ApplicationController
  
  before_action :set_profile, only: [:edit, :update]
  
  def show # 追加
    @developer = Developer.find(params[:id])
    @products = @developer.products
  end
  
  def new
    @developer = Developer.new
  end
  
  def edit
  end
  
  def update
    if @developer.update(developer_params)
      redirect_to @developer
      flash[:success] = "編集に成功しました"
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  def create
    @developer = Developer.new(developer_params)
    if @developer.save
      session[:developer_id] = @developer.id
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
  
  def set_profile
    @developer = Developer.find(params[:id])
  end
  
end
