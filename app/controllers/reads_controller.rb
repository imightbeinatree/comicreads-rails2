class ReadsController < ApplicationController
  def new
  end

  def create
     @read = Read.new()
     @comic = Comic.find_by_title(params[:comic])
     if @comic
       @issue = Issue.find_by_issue_num_and_comic_id(params[:issue_num],@comic.id)
     else
       @comic = Comic.create(:title => params[:comic])
       @issue = Issue.find_by_issue_num_and_comic_id(params[:issue_num],@comic.id)
     end
     unless @issue
       @issue = Issue.create(:issue_num => params[:issue_num], :comic_id => @comic.id)
     end
     @read.issue_id = @issue.id
     @read.read_date = params[:read_date][:read_date]
     @read.notes = params[:notes]
     if @read.save
       flash[:notice] = "Read Saved!"
       redirect_to reads_path
     else
       flash[:error] = "Error Saving Read"
       render :action => 'new'
     end
  end

  def index
    @reads = Read.all(:order => 'read_date DESC, id DESC')
  end


end
