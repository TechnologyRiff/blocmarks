class IncomingController < ApplicationController
skip_before_action :verify_authenticity_token, only: [:create]

def create
  #puts "INCOMING PARAMS HERE: #{params}"
  @user = User.find_by(email: params[:sender])
  @topic = Topic.find_or_create_by(title: params[:subject])
  @url = params["stripped-text"]

  if @user.nil? 
    User.invite!(email: params[:sender], name: params[:sender])
  end
  #   @user = User.new(params[:sender])
  #   @user.save #check if the user is nil, if so , create and save a new user
  # else 
  # end

  @bookmark = Bookmark.new(user: @user, topic: @topic, url: @url)
  authorize @bookmark
  @bookmark.save

    head 200
  end

end
