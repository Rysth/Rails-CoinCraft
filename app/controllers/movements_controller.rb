class MovementsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @movement = Movement.new
  end

  def create
    @category = Category.find_by(id: params[:category_id])

    if @category.nil?
      redirect_to root_path, alert: 'Category not found'
      return
    end

    @movement = @category.movements.build(set_params)
    @movement.author_id = current_user.id
    if @movement.save
      redirect_to category_path(@category), notice: 'Transaction created successfully'
    else
      render :new, alert: 'Error creating the Transaction'
    end
  end

  def set_params
    params.require(:movement).permit(:name, :amount)
  end
end
