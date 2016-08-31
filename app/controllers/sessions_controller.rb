class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = @user.id
    redirect_to root_url
  end

  def destroy
    @current_user = session[:user_id] = nil
    redirect_to root_url
  end

  def index
    redirect_to root_url if signed_in?
  end
end
