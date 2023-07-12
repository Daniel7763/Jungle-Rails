class SessionsController < ApplicationController
  def new
  end

  def create
    if user = User.authenticate_with_credentials(params[:session][:email], params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/', notice: 'Logged in successfully.'
    else
      redirect_to '/login'
    end
  end

  def destroy
    # Clear the session to log out the user
    session[:user_id] = nil
    redirect_to '/login', notice: 'Logged out successfully.'
  end
end