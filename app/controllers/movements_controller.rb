class MovementsController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :set_category, only: %i[new create]

  def new
    @movement = Movement.new
  end

  def create
    @movement = Movement.new(set_params)
    @movement.amount.to_f
    @movement.author_id = current_user.id
    @category.movements << @movement
    if @movement.save!
      redirect_to category_path(@category), notice: 'Transaction created successfully'
    else
      render :new, alert: 'Error creating the Transaction'
    end
  end

  private

  def set_user
    @user = current_user
  end

  def set_category
    @category = @user.categories.find(params[:category_id])
  end

  def set_params
    params.require(:movement).permit(:name, :amount)
  end
end
