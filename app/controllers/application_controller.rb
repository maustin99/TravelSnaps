class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

 #needs to be added to make sure current_user METHOD is available is all VIEWS (HTML)  
helper_method :current_user, :logged_in?, :body_background_img

#returns the user that made current request
def current_user

  #if currect_user exists, RETURN it, OTHERWISE, find that user...
  #BUT ONLY if the cookie even exists
  return @current_user ||= User.find(session[:user_id]) if session[:user_id] #if session[:user_id] exists
  
  ### Another way to write this ####
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

def body_background_img

  if logged_in? && current_user.pictures.length > 0

    return current_user.pictures.sample.picture_url
  else
    random_images = [
      'https://www.hawaiimagazine.com/sites/default/files/field/image/kauai-tor-hta.jpg',
      'https://d1ljaggyrdca1l.cloudfront.net/wp-content/uploads/2017/03/lion-in-the-grass-in-serengeti-national-park-1600x900.jpg',
      'https://www.monde-du-voyage.com/republique-dominicaine/week-end-republique-dominicaine.jpg',
      'http://www.wallpapers13.com/wp-content/uploads/2017/09/Fitz-Roy-Mountain-in-South-America-Patagonia-between-Argentina-and-Chile-in-the-nearby-El-Chalt%C3%A9n-village-sunsets-Landscape-3840x2160-1024x768.jpg',
      'http://albaclub.ru/upload/iblock/6b7/6b7bfc159142ffbf363a2c02b9abdfb3.jpg'
    ]
    return random_images.sample
  end

end

end
