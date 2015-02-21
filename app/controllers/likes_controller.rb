class LikesController < ApplicationController

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[notice:] = "Topic bookmarked."
      redirect_to @bookmark
    else
      flash[notice:] = "Bookmark deleted."
      redirect_to @bookmark
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
