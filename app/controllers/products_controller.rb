class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @ratings = Rating.where(product_id: @product.id)
    # @average = Review.where(product_id: @productid).average(:rating)
    puts @ratings.inspect
  end

end
