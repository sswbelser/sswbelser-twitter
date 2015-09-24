class SessionsController < ApplicationController
  # creations session based on the omniauth data
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    flash[:notice] = "Successfully logged in"
    redirect_to root_path
  end

  # log out / destroys the session
  def destroy
    session[:user_id] = nil
    flash[:error] = "Successfully logged out"
    redirect_to root_path
  end
end