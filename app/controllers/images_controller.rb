class ImagesController < ApplicationController
  def create
    @image = Image.new
    @image.image = params[:image][:image]
    if @image.save
      redirect_to image_path(@image)
    else
      render 'home/index'
    end
  end

  def show
    @image = Image.find(params[:id])
  end
end
