class UsersController < ApplicationController
  
  before_action :authorize, only: [:show]  #run authorize in application controller
  #will prevent the ACTION from being executed 
  #(and redirect) unless logged in...
  #BUT only for SHOW at the moment


  
  def index

    @users = User.all

  end

  def show

    @user = User.find(params[:id])
    @pictures = Picture.all

  end

  def new

    @user = User.new
    
  end

  def create

    @user = User.new(user_params)    #return ONLY the params we specified below

    @user.profile_pic = "https://image.flaticon.com/icons/png/512/78/78373.png"

    if @user.save
      session[:user_id] = @user.id
      redirect_to pictures_path
    else
      redirect_to new_user_path     
    end

  end

  def edit

    @user = User.find(params[:id]) 

  end

  def update

    @user = User.find(params[:id])

    if @user.update(user_params)
      session[:user_id] == @user.id
        redirect_to user_path
    else
      redirect_to edit_user_path     
    end


  end

  def destroy

    @user = User.find(params[:id])  #destroy  USER

    if @user.destroy 

      session[:user_id] = nil

      redirect_to root_path
    end
    
  end

  private
  def user_params

    return params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_pic)
  end


end
