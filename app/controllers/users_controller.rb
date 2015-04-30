class UsersController < ApplicationController
  before_action :authenticate_user!

  

  def show
    @user = User.find(params[:id])
    @saved_bookmarks = @user.bookmarks
    @liked_bookmarks = @user.likes

    
    @added_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.likes
  end

  
  #visible to?
  #do we need user params?
end
