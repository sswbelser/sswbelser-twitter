class TweetsController < ApplicationController

  def new
  end
	
  # creates a new tweet based on the twitter parameters
  def create
    if current_user
      if current_user.tweet(twitter_params[:message])
        flash[:notice] = "Successfully tweeted!"
        redirect_to root_path
      else
        flash[:error] = tweet.errors.full_messages.join(', ')
        redirect_to root_path
      end
    else
      flash[:error] = "Need to log in to create tweet"
      redirect_to root_path
    end
  end

  # sets the parameters for tweets
  def twitter_params
    params.require(:tweet).permit(:message)
  end

end