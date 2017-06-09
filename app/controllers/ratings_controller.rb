class RatingsController < ApplicationController

 def create
    @rating = Rating.new(review_params)
    @rating.user = user.[rating.user_id].name
    @rating.user_id = session[:user_id]
    @rating.product_id = params[:product_id]
    if @rating.save
      redirect_to '/products/#{params[:product_id]}'
    end
  end

 private
  def rating_params
    params.require(:rating).permit(:rating, :description)
  end

end