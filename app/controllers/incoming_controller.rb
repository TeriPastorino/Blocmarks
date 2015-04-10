class IncomingController < ApplicationController
  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    puts "INCOMING PARAMS HERE: #{params}"

    @user = User.find_by(email: params[:sender])
    @url = params["body-plain"]
    if @user.present?
      @topic = @user.topics.find_or_create_by(title: params[:subject])
      @topic.bookmarks.create(url: @url)
    end
    head 200
  end
end
