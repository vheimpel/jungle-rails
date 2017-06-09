class RatingsController < ApplicationController

 def create
    @rating = Rating.new(rating_params)
    @rating.user_id = session[:user_id]
    @rating.product_id = params[:product_id]
    if @rating.save
      redirect_to '/products/' + @rating.product_id.to_s
    end
  end

 private
  def rating_params
    params.require(:rating).permit(:rating, :description)
  end

end