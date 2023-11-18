class SplashController < ApplicationController
  def index
    redirect_to root_path if current_user
  end
end
