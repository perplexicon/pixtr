class LikesController < ApplicationController
  def create
    image = Image.find(params[:id])
    current_user.like(image)
    redirect_to [image.gallery, image], notice: "Liked image successfully"
  end

  def destroy
    image = Image.find(params[:id])
    current_user.unlike(image)

    redirect_to [image.gallery, image], notice: "Image unliked"
  end


  
end
