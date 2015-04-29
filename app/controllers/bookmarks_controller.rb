class BookmarksController < ApplicationController
  before_action: :authenticate_user!
  #before_action: :get_bookmark, only: [:edit, :update]
  #before_action: :get_topic, only: [:edit, :show, :update, :destroy]
  #need to write
  
  def index
    @bookmarks = Bookmark.all
  end
  
  def show
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmark.find(params[:id])
    @bookmarks = @topic.bookmark.paginate(page: params[:page], per_page: 8)
    #authorize @topic
    authorize @bookmark
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
    authorize @bookmark
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.build(bookmark_params)
    @bookmark.user = current_user
    @bookmark.topic = @topic
    authorize @bookmark

    if @bookmark.save
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
      flash[:notice] = "Bookmark was updated"
      redirect_to @bookmark.topic
    else
      flash[:error] = "Error updating bookmark"
      render :edit

      
    end
  end

  def edit
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

    
  end

  def destroy
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.find(params[:id])
    #title = @bookmark.title
    authorize @bookmark

    if @bookmark.destroy
      flash[:notice] = "Bookmark was deleted"
      # ajax -redirect_to topic_path @topic
    else
      flash[:error] = "Error deleting bookmark"
      # ajax - redirect_to topic_path @topic
    end

    respond_to do |format|
      format.html { redirect_to topic_path(current_user) }
      format.js
    end
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:url)
    
  end
end  


