class BookmarksController < ApplicationController
  def show
    @bookmarks = Bookmark.all
    authorize @bookmarks
  end

  def new
    @bookmarks = Bookmark.new
    authorize @bookmark
  end

  def edit

  end
end
