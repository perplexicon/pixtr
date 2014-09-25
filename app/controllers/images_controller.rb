class ImagesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.gallery_id = params[:gallery_id]
    @gallery = @image.gallery
    if @image.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def show
    @image = Image.find(params[:id])
    @gallery = @image.gallery
    @comment = Comment.new
  end

  def edit
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    @gallery = @image.gallery
    if @image.update(image_params)
      redirect_to [@gallery, @image]
    else
      render :edit
    end
  end

  def destroy
    image = Image.find(params[:id])
    gallery = image.gallery
    image.destroy
    redirect_to gallery_path(gallery)
  end

  private

  def image_params
    params.require(:image).permit(:name, :description, :url, group_ids: [], tag_ids: [])
  end
end
