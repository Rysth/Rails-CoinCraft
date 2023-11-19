class MovementsController < ApplicationController
  def new
    @category = Category.find(params[:category_id])
    @movement = Movement.new
  end
end