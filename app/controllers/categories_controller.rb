class CategoriesController < ApplicationController
  def index
    @categories = current_user.categories.includes(:movements)
    @movements = []
    @categories.each do |category|
      @movements += category.movements.where(author_id: current_user.id).to_a
    end
  end

  def show
    @category = current_user.categories.find(params[:id])
    @movements = @category.movements.where(author_id: current_user.id).order(created_at: :desc)
    @total_amount = @movements.sum(&:amount)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(set_params)
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
