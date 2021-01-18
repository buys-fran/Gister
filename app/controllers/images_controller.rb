class ImagesController < ApplicationController
  def create
    @image = Image.new
    @image.image = params[:image][:image]
    @image.save!
  end
end
