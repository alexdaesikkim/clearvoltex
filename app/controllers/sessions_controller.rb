class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
  	if user && user.authenticate(params[:session][:password])
      if user.active
    		log_in(user)
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        if user.role == "regular"
    		  redirect_to user
        else
          redirect_to '/admin'
        end
        flash[:success] = "Logged in!"
      else
        render 'new'
        flash[:warning] = "Your account has not been activated yet."
      end
  	else
  		render 'new'
      flash[:warning] = "Invalid username/password combination"
  	end
  end

  def destroy
    log_out if logged_in?
    redirect_to '/'
    flash[:success] = "Logged out!"
  end
end
