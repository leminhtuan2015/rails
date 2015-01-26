class SessionsController < ApplicationController
 #the Sessions controller actions have followed the RESTful convention of 
 #using new for a login page and create to complete the login.
 #We’ll continue this theme by using a destroy action to delete sessions


  # Automaticly render (include) new.html.erb	
  #	render "new"
  # the login form is handled by the new action
  def new
    @user = User.new
  end

  def create
    #logging in is handled by sending a POST request to the create action 

  	email = params[:session][:email].downcase
    pass = params[:session][:password];

    user = User.find_by(email: email)
    if user && pass==(user.password)
      log_in user
      redirect_to current_user
      #infer that /user(current_user) => call user#show
    else
      # Create an error message.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    #logging out is handled by sending a DELETE request to the destroy action 
    log_out
    redirect_to root_url
  end
end