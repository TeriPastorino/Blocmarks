class IncomingController < ApplicationController
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(params[email: :sender])
    @topic = @user.topic.find_by(params[:subject])
    @url = params["body-plain"]

    @user.nil?
      @user = User.new
     # Check if user is nil, if so, create and save a new user
     @topic.nil?
     # Check if the topic is nil, if so, create and save a new topic
    @bookmark = Bookmark.create(url: @url)
    @bookmark.topic = @topic
    @bookmark.user = @user
    @bookmark.save
    #referenced bloccit project - but missing pieces
     # Now that we're sure we have a valid user and topic, build and save a new bookmark

    # Assuming all went well. 
    head 200
  end

end
