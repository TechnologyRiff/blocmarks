class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      #add code to generate a success flash and redirect to @bookmark
    else
      #add code to generate a failure flash and redirect to @bookmark
    end
  end

  def destroy
    #get the bookmark from the params
    #find the current user's like with the ID in the params
    if like.destroy
      #flash success and redirect to @bookmark
    else
      #flash error and redirect to @bookmark
    end
  end

end
