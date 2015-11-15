class ProductsController < ApplicationController
  
  before_action :logged_in_developer, only: [:create]
  before_action :set_product, only: [:edit, :update, :show]
  
  def show
    @comment = current_user.comments.build if user_logged_in?
    # has_manyを使うべし
    @comments = @product.comments
    #@comments = Comment.all.where(product_id: params[:id]) #一応こちらでもいける
  end  
  
  def edit
    #binding.pry
    image_01=FastImage.new(@product.img_screenshot_01.url)
    if image_01.size==nil
      @image_size_01 = [320,568]
    elsif 
      @image_size_01 = image_01.size
    end
    image_02=FastImage.new(@product.img_screenshot_02.url)
    if image_02.size==nil
      @image_size_02 = [320,568]
    elsif 
      @image_size_02 = image_02.size
    end
    image_03=FastImage.new(@product.img_screenshot_03.url)
    if image_03.size==nil
      @image_size_03 = [320,568]
    elsif 
      @image_size_03 = image_03.size
    end
    image_04=FastImage.new(@product.img_screenshot_04.url)
    if image_04.size==nil
      @image_size_04 = [320,568]
    elsif 
      @image_size_04 = image_04.size
    end
    image_05=FastImage.new(@product.img_screenshot_05.url)
    if image_05.size==nil
      @image_size_05 = [320,568]
    elsif 
      @image_size_05 = image_05.size
    end
  end
  
  def update
    if @product.update(product_params)
      redirect_to @product.developer
      flash[:success] = "編集に成功しました"
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
  
  def new
    #binding.pry
    @product = current_developer.products.build if dev_logged_in?  
    @image_size_01 = [320,568]
    @image_size_02 = [320,568]
    @image_size_03 = [320,568]
    @image_size_04 = [320,568]
    @image_size_05 = [320,568]
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
    params.require(:product).permit(:appname,
                                    :summary,
                                    :description,
                                    :category,
                                    :price,
                                    :model_iphone,
                                    :model_android,
                                    :model_web,
                                    :img_icon,
                                    :img_screenshot_01,
                                    :img_screenshot_02,
                                    :img_screenshot_03,
                                    :img_screenshot_04,
                                    :img_screenshot_05)
  end
  
  def set_product
    @product = Product.find(params[:id])
  end
end
