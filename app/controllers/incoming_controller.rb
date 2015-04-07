class IncomingController < ApplicationController
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = @user.topics.find_by(title: params[:subject])
    @url = params["body-plain"]

    @user = User.create(email: params[:sender]) unless @user.present?
     # Check if user is nil, if so, create and save a new user
    @topic = Topic.create(title: params[:subject]) unless @topic.present?
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
