class BookmarksController < ApplicationController
    before_action :logged_in_user

  def create
    @product = Product.find(params[:product_id])
    current_user.bookmarking(@product)
    redirect_to params[:redirect_url]
  end

  def destroy
    @product = current_user.bookmarking_products.find(params[:id])
    current_user.unbookmarking(@product)
    redirect_to params[:redirect_url]
  end
  
end
