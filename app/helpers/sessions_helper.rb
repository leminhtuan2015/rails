module SessionsHelper

#such helpers are automatically included in Rails views;
#by including the module into the base class of all controllers 
#(the Application controller),
#we arrange to make them available in our controllers as well 


  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end
  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def test_module
	@test = "Module"
  end

end
