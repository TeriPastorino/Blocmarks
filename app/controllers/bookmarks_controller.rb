class BookmarksController < ApplicationController
  
#do we have to authorize? guessing not since we already had them sign in to see anything?
  def show
    @bookmarks = @topic.Bookmark.find(params[:id])
    #authorize @bookmarks
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmarks = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user
    authorize @bookmark

    if bookmark.save
      flash[:notice] = "Bookmark Saved"
      redirect_to @topic
    else
      flash[:error] = "Error Saving Bookmark"
      render :new
    end
  end


  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.update_attributes(bookmark_params)
      redirect_to @bookmark.topic
    else
      flash[:error] = "Error updating bookmark"
      render :edit
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmarks
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted"
      redirect_to @bookmark.topic
    else
      flash[:error] = "Error deleting bookmark"
      render :show
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
    
  end
end  


