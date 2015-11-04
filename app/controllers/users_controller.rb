class UsersController < ApplicationController
  
  before_action :set_profile, only: [:edit, :update]
  
  def show # 追加
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def edit
  end 
  
  def update
    if @user.update(user_params)
      redirect_to @user
      flash[:success] = "編集に成功しました"
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save(context: :registration)
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user # ここを修正
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password,
                                                    :password_confirmation)
  end
  
  def set_profile
    @user = User.find(params[:id])
  end
  
end
