class IncomingController < ApplicationController
skip_before_action: verify_authenticity_token, only: [:create]

def create
  #Find the user by using params[:sender]
  #Find the topic by using params[:subject]
  #Assign the url to a variable after retrieving it from params["body-plain"]

  if user.nil? #check if the user is nil, if so , crate and save a new user

  else 
  if topic.nil? #Check if the topic is nil, if so, create and save a new topic

  else
  #Now that we're sure we have a valid user and topic, build and save a new bookmark
  head 200
end

end
