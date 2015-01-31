class UsersController < ApplicationController
#POST /users
#POST /users.json 

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver_now
      
        format.html { redirect_to(@user, notice: 'User was successfully created.') }
        format.json { render json: @user, status: :created,
          location: @user }
        else
          format.html { render action: 'new' }
          format.json { render json: @user.errors, status: 
            :unprocessable_entity }
        end
      end
    end

  def show
    #populate @user_bookmarks with the user's bookmarks
    #populate @like_bookmarks with liked bookmarks
    
  end
end
