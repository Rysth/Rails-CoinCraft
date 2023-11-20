class MovementsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @movement = Movement.new
  end

  def create
    @category = Category.find(params[:category_id])
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
