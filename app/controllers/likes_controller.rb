class LikesController < ApplicationController
   def create
     @bookmark = Bookmark.find(params[:bookmark_id])
     @like = current_user.likes.build(bookmark: @bookmark)
    
    authorize @like
    if @like.save
       flash[:notice] = "You liked this bookmark"
       redirect_to [@bookmark.topic]
    else
      flash[:error] = "There was an error Please try again."
      redirect_to [@bookmark.topic]        
    end
   end

   def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    @like = current_user.likes.find(params[:id])

    authorize @like
     # Get the bookmark from the params
     # Find the current user's like with the ID in the params
 
     if @like.destroy
      flash[:notice] = "You successfully unliked this"
      redirect_to [@bookmark.topic]
    else
      flash[:warning] = "There was an error un-likings"
      redirect_to [@bookmark.topic]
    end
  end
end
