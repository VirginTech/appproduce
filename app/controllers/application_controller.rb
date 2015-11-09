class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  include Jpmobile::ViewSelector
  include UserSessionsHelper
  include DevSessionsHelper
  
  $category = [1,2,3,4,5,6,7,8,9]
  $model = [1,2,3]
  $price = [1,2]
  
  $app_edit_flg = false
  
  private
  def logged_in_user
    unless user_logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def logged_in_developer
    unless dev_logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end
  
end
