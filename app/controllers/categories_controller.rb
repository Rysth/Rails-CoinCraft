class CategoriesController < ApplicationController
  before_action :set_user, only: %i[index show create]
  before_action :set_category, only: %i[create]

  def index
    @categories = @user.categories.includes(:movements)
    @movements = @categories.flat_map { |category| category.movements.where(author_id: current_user.id).to_a }
  end

  def show
    @category = @user.categories.find(params[:id])
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

  private

  def set_user
    @user = current_user
  end

  def set_category
    @category = @user.categories.find(params[:id])
  end

  def set_params
    params.require(:category).permit(:name, :icon)
  end
end
