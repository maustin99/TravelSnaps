class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 #needs to be added to make sure current_user METHOD is available is all VIEWS (HTML)  
helper_method :current_user, :logged_in?

#returns the user that made current request
def current_user

  #if currect_user exists, RETURN it, OTHERWISE, find that user...
  #BUT ONLY if the cookie even exists
  return @current_user ||= User.find(session[:user_id]) if session[:user_id] #if session[:user_id] exists
  
    # if @current_user
  #   return @current_user
  # else
  #   if session[:user_id]
  #     @current_user = User.find(session[:user_id])
  #     return @current_user
  #   else
  #     return nil
  #   end
  # end

end

def logged_in?
  !!current_user()   #checks the boolean of current_user method right above it "IS TRUE?"
end

def authorize
  redirect_to new_session_path unless logged_in?
end

end
