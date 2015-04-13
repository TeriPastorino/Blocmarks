class UsersController < ApplicationController
  def index
  end

  def update
  end

  def show
    @user = User.find(params[:id])
    
  end
end
