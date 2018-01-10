class CommentsController < ApplicationController
  def new
  end

  def create

    @picture = Picture.find(params[:picture_id])

    @comment = Comment.new(comment_params)
 
    @comment.user_id = session[:user_id]        
                
    @comment.picture = @picture    ##<<<===== Associate THIS PICTURE with THIS COMMENT, but through the current COMMENT!

    if @comment.save    #checks if CREATE was successfull (TRUE)

      #obejct saved to DB, ID assigned, redirected to Show page
      redirect_to picture_path(@picture)
    else
      redirect_to picture_path(@picture)    #if failed reutrn to NEW form 
    end # end IF


    
  end

  def edit
  end

  def update
  end

  def destroy

    @comment = Comment.find(params[:id])
    @picture = Picture.find(params[:picture_id]) #current picture


    if @comment.destroy 
        redirect_to picture_path(@picture)
    end

  end

  private    #FOR SECURITY 
  def comment_params
    return params.require(:comment).permit(:body)
  end


end
