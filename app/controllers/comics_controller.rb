class ComicsController < ApplicationController
  def index
    @comics = Comic.paginate(:page => params[:page], :order => 'title')
  end
end
