class UsersController < ApplicationController
  def index
  end

  def update
  end

  def show
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :likes)
  end

end
