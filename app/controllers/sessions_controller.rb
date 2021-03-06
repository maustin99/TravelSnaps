class SessionsController < ApplicationController

  #login form view
  #we don't have a MODEL for SESSIONS, so the FORM must be created differently
  def new
  end


  #create a cookie and redirect
  def create

    #check if email already exists
    @user = User.find_by_email(params[:email])
     

    #if user exists and password correct
    if @user && @user.authenticate(params[:password])
       #generate cookie with id and redirect
       session[:user_id] = @user.id   #a built-in session hash from Rails. It acts like a :PARAMS
       flash[:success] = "Welcome #{@user.name}!"  #built-in success message
       redirect_to pictures_path(@user)
    else
      #either email or password is not correct
      flash[:danger] = "Email or Username is incorrect."  #built-in warning message
      redirect_to new_session_path
    end #end if

  end #END CREATE ---------------------


  #logout
  def destroy

    session[:user_id] = nil
    #current_user.destroy

    redirect_to new_session_path

  end


end
