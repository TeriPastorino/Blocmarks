class BookmarksController < ApplicationController
  def show
    @bookmarks = Bookmark.all
    authorize @bookmarks
  end

  def new
    @topic = Topic.find(params[:id])
    @bookmarks = Bookmark.new
    authorize @bookmark
  end

  def edit

  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
    
  end
  

end
