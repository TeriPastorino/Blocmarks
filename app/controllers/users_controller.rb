class UsersController < ApplicationController
  before_action :authenticate_user!

  #bang or no bang?

  def show
    @user = User.find(params[:id])
    @added_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.likes
  end

  def index
     @users = User.top_rated.paginate(page: params[:page], per_page: 10)
   end
  #visible to?
  #do we need user params?
end
