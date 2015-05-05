class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    # find the current users bookmarks
    # group them by bookmark.topic.title    
    @added_bookmarks = current_user.bookmarks.includes(:topic).group_by do |bookmark|
      bookmark.topic   
    end
  end
    
  def liked
    #find current users likes
    #group by bookmark.topic.title
    @liked_bookmarks = current_user.liked_bookmarks.includes(:topic, :likes).group_by do |bookmark|
    bookmark.topic
    end
  end    

  
end
  

