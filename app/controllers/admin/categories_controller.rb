class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV["HTTP_USERNAME"], password: ENV["HTTP_PWORD"]

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @categories = Category.new
  end

  def create
    @categories = Category.new(category_params)

    if @categories.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end

  def destroy
    @category = Category.find params[:id]
    @category.destroy
    redirect_to [:admin, :categories], notice: 'Category deleted!'
  end

  private

  def category_params
    params.require(:category).permit(
      :name,
      :created_at,
      :updated_at,
    )
  end

end
