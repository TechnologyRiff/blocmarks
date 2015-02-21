class TopicsController < ApplicationController
  
  def index
    @topics = Topic.visible_to(current_user).paginate(page: params[:page], per_page: 10)
    authorize @topics
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
    @bookmarks = @topic.bookmarks.includes(:user).includes(:likes).paginate(page: params[:page], per_page: 10)
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
    @topic = Topic.build(topic_params)
    @topic.save
  end

private
  def topic_params
    params.require(:topic).permit(:title)
end

