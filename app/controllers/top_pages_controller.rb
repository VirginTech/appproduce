class TopPagesController < ApplicationController
  
  def top
    @products=Product.all
  
    $category = [1,2,3,4,5,6,7,8,9]
    $model = [1,2,3]
    $price = [1,2]    
  
    self.getName()
  end
  
  def search
    #binding.pry
    $category = params[:category] if params[:category]!=nil 
    $model = params[:model] if params[:model]!=nil 
    $price = params[:price] if params[:price]!=nil
    
    @products = Product.where(category: $category, model: $model, price: $price)
    self.getName()
  end
  
  def getName
    if $category=="1"
      @category_name="カテゴリ１"
    elsif $category=="2"
      @category_name="カテゴリ２"
    elsif $category=="3"
      @category_name="カテゴリ３"
    elsif $category=="4"
      @category_name="カテゴリ４"
    elsif $category=="5"
      @category_name="カテゴリ５"
    elsif $category=="6"
      @category_name="カテゴリ６"
    elsif $category=="7"
      @category_name="カテゴリ７"
    elsif $category=="8"
      @category_name="カテゴリ８"
    elsif $category=="9"
      @category_name="カテゴリ９"
    else
      @category_name="すべて"
    end
    
    if $model=="1"
      @model_name="iPhone"
    elsif $model=="2"
      @model_name="Android"
    elsif $model=="3"
      @model_name="Webゲーム"
    else
      @model_name="すべて"
    end

    if $price=="1"
      @price_name="無料"
    elsif $price=="2"
      @price_name="有料"
    else
      @price_name="すべて"
    end
  end
  
end
