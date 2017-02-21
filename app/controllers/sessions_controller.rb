class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      flash[:success] = "Logged in!"
  		redirect_to user
  	else
      flash[:warning] = "Invalid username/password combination"
  		render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "Logged out!"
    redirect_to '/login'
  end
end
