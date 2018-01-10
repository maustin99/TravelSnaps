class CommentsController < ApplicationController
  def new
  end

  def create

    @picture = Picture.find(params[:id])

    picture.comment.create({
    body: params[:comment][:body]
    user: session[:user_id]
    })

    redirect_to picture_path(@picture)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
