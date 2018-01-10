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

    if @user.save
      session[:user_id] = @user.id
      redirect_to pictures_path
    else
      redirect_to new_user_path     
    end

  end

  def edit
  end

  def update
  end

  def destroy

    @user = User.find(params[:id])  #destroy  USER

     #@user = Comment.select { |c| c.user_id == 11 }
     #@user = Picture.select { |c| c.user_id == 11 }

    @comments = Comment.all
    @comments.destroy      #{ |c| c.user_id == params[:id].to_i }
    

    if @user.destroy 


      redirect_to users_path
    end
    
  end

  private
  def user_params

    return params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end


end
