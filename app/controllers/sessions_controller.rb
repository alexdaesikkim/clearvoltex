class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(username: params[:session][:username].downcase)
  	if user && user.authenticate(params[:session][:password])
      if user.active
    		log_in(user)
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        flash.now[:success] = "Logged in!"
        if user.role == "regular"
    		  redirect_to user
        else
          redirect_to '/admin'
        end
      else
        flash.now[:warning] = "Your account has not been activated yet."
        render 'new'
      end
  	else
      flash.now[:warning] = "Invalid username/password combination"
  		render 'new'
  	end
  end

  def destroy
    log_out if logged_in?
    flash.now[:success] = "Logged out!"
    redirect_to '/'
  end
end
