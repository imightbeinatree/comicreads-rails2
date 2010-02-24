class ComicsController < ApplicationController
  

  def index
    @comics = Comic.paginate(:page => params[:page], :order => 'title')
  end

  def destroy
    @comic = Comic.find params[:id]
    @comic.destroy
    flash[:notice] = "comic deleted"
    redirect_to comics_path
  end

  def show
    @comic = Comic.find params[:id]
  end

end
