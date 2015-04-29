class TopicsController < ApplicationController
  before_action :authenticate_user!
  #before_action :get_topic, only: [:edit, :show, :update, :destroy]
  respond_to :html, :js
  
  def index
    @topics = Topic.paginate(page: params[:page], per_page: 8)
  end

  def show
    @topic = Topic.find(params[:id])
    @bookmarks = @topic.bookmarks.paginate(page: params[:page], per_page: 8)
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = current_user.topics.build(topic_params)
    authorize @topic

    if @topic.save
      redirect_to topics_path, notice: "Topic was added"   
    else
      flash[:error] = "There was an error creating Topic. Please try again"
      render :new
    end    
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic

    if @topic.update_attributes(topic_params)
      render :show
    else
      flash[:error] = "Error saving, try again"
      render :edit
    end
  end


  #create and destroy from the topics#index view
  def destroy
    @topic = Topic.find(params[:id])
    #name = @topic.title
    authorize @topic
    if @topic.destroy
      flash[:notice] ="\"#{@topic.title}\" topic was deleted."
     #for - ajax topics_path
    else
      flash[:error] = "There was an error deleting"
      #for - ajax render :show
    end

    respond_to do |format|
      format.html { redirect_to my_bookmarks_path(current_user) }
      format.js
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end

