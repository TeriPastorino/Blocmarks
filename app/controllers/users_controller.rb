class UsersController < ApplicationController
  before_action :authenticate_user!

  

  def show
    @added_bookmarks = current_user.bookmarks
    @liked_bookmarks = current_user.likes
  end

  
  #visible to?
  #do we need user params?
end
