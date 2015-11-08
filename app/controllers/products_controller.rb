class ProductsController < ApplicationController
  
  before_action :logged_in_developer, only: [:create]
  before_action :set_product, only: [:edit, :update]
  
  def edit
    #set_productしてる
    #@product = current_developer.products.find(params[:id])
  end
  
  def update
    if @product.update(product_params)
      redirect_to @product.developer
      flash[:success] = "編集に成功しました"
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end  end
  
  def new
    #binding.pry
    @product = current_developer.products.build if dev_logged_in?  
  end
  
  def create
    @product = current_developer.products.build(product_params)
    if @product.save
      flash[:success] = "新規アプリを登録しました！"
      redirect_to @product.developer
    else
      render 'new'
    end
  end
  
  private
  def product_params
    params.require(:product).permit(:appname,:summary,:description,:category,:price,:model,:img_icon,
          :img_screenshot_01,:img_screenshot_02,:img_screenshot_03,:img_screenshot_04,:img_screenshot_05)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end
end
