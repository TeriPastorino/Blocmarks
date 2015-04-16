class BookmarksController < ApplicationController
  
#do we have to authorize? guessing not since we already had them sign in to see anything?
  def show
    @bookmarks = @topic.Bookmark.find(params[:id])
    #authorize @bookmarks
  end

  def new
    @bookmarks = Bookmark.new
    #authorize @bookmark
  end

  def edit

  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
    
  end
  

end
