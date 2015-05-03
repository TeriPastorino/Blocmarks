class UsersController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def show
    # find the current users bookmarks
    # group them by bookmark.topic.title    
    @added_bookmarks = current_user.bookmarks.includes(:topic, :likes).group_by do |bookmark|
      bookmark.topic     
    end

    @liked_bookmarks = current_user.likes 
  end
end
  

