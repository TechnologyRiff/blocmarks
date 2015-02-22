class TopicsController < ApplicationController
  before_action :authenticate_user!

  def index
    @topics = Topic.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
    @bookmarks = @topic.bookmarks.includes(:user).includes(:likes).paginate(page: params[:page], per_page: 10)
  end

  def new
    @topic = Topic.new(topic_params)
    @topic.user = current_user
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user
    authorize @topic
    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to topics_path
    else
      flash[:error] = "Error saving topic, please try again."
      redirect_to topics_path 
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(topic_params)
      flash[:notice] = "Topic was updated successfully."
      redirect_to topics_path
    else
      flash[:error] = "Topic was not updated. Please try again."
      redirect_to topics_path
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end

end

