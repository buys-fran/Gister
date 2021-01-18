class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @image = Image.new
  end
end
