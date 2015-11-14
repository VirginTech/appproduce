class TopPagesController < ApplicationController
  
  def top
    @products=Product.all
  
    $category = [1,2,3,4,5,6,7,8,9]
    $price = [1,2]
  
    $model_iphone = [true,false]
    $model_android = [true,false]
    $model_web = [true,false]
  
    $app_edit_flg = false
    
    self.getName()
  end
  
  def sort
    if params[:order]=="0"
      @sort_name="新着順"
      @products = Product.all.order(created_at: :desc)
    else
      @sort_name="ランキング順"
      bookmarked_ids = Bookmark.group(:product_id)
                                .order('count_product_id desc')
                                .count('product_id')
                                .keys
      #binding.pry
      bookmarked_ids += Product.pluck(:id) - bookmarked_ids
      @products = Product.find(bookmarked_ids).sort_by{|o| bookmarked_ids.index(o.id)}
    end
  end
  
  def search
    
    #binding.pry
    $category = params[:category] if params[:category]!=nil 
    $price = params[:price] if params[:price]!=nil
    
    if params[:model]!=nil
      $model_iphone=[true,false]
      $model_android=[true,false]
      $model_web=[true,false]
      if params[:model]=="1" 
        $model_iphone=true
      elsif params[:model]=="2" 
        $model_android=true
      elsif params[:model]=="3"
        $model_web=true
      end
    end

    @products = Product.where(category: $category, 
                              model_iphone: $model_iphone, 
                              model_android: $model_android, 
                              model_web: $model_web, 
                              price: $price)

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

    if $price=="1"
      @price_name="無料"
    elsif $price=="2"
      @price_name="有料"
    else
      @price_name="すべて"
    end
    
    if $model_iphone==true
      @model_name="iPhone"
    elsif $model_android==true
      @model_name="Android"
    elsif $model_web==true
      @model_name="Webゲーム"
    else
      @model_name="すべて"
    end

  end
  
end
