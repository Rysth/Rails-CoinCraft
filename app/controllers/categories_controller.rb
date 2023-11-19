class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(set_params)
    if @category.save
      redirect_to categories_path, notice: 'Category created successfully'
    else
      render :new, alert: 'Error creating the Category'
    end
  end

  def set_params
    params.require(:category).permit(:name, :icon)
  end
end
