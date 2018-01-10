class PicturesController < ApplicationController
  def index

    @pictures = Picture.all

  end

  def show

    @picture = Picture.find(params[:id])

  end

  def new
    
    @pictures = Picture.new

  end

  def create

    @picture = Picture.new(picture_params)    
    @picture.user = current_user   # <<==== FIX HERE
    # same as:
    # @picture = current_user.pictures.new(picture_params)
  
    if @picture.save    #checks if CREATE was successfull (TRUE)

      redirect_to pictures_path
    else
      redirect_to new_picture_path   #if failed reutrn to NEW form 
    end # end IF


  end

  def edit

    @picture = Picture.find(params[:id])

  end

  def update

    @picture = Picture.find(params[:id]) 
    
    @picture.picture_url = params[:picture][:picture_url]
    @picture.caption = params[:picture][:caption]
    @picture.city = params[:picture][:city]
    @picture.country = params[:picture][:country]

      if @picture.save    #checks if UPDATE was successfull (TRUE)
        
        #obejct saved to DB, ID assigned, redirected to GET page
        redirect_to picture_path(@picture)
      else
        redirect_to edit_picture_path(@picture)   #if failed reutrn to EDIT form 
      end # end IF

  end



  def destroy

    @picture = Picture.find(params[:id])

    if @picture.destroy 
        redirect_to pictures_path
    end

    
  end

  private    #FOR SECURITY 
  def picture_params
    return params.require(:picture).permit(:picture_url, :caption, :city, :country)
  end


end
