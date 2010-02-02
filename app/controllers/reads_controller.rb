class ReadsController < ApplicationController
  def new
  end

  def create
     @read = Read.new()
     @comic = Comic.find_by_title(params[:read][:comic])
     if @comic
       @issue = Issue.find_by_issue_num_and_comic_id(params[:read][:issue_num],@comic.id)
     else
       @comic = Comic.create(:title => params[:read][:comic])
       @issue = Issue.find_by_issue_num_and_comic_id(params[:read][:issue_num],@comic.id)
     end
     unless @issue
       @issue = Issue.create(:issue_num => params[:read][:issue_num], :comic_id => @comic.id)
     end
     @read.issue_id = @issue.id
     @read.read_date = Date.today
     @read.notes = params[:read][:notes]
     if @read.save
       flash[:notice] = "Read Saved!"
       render :action => 'index'
     else
       flash[:error] = "Error Saving Read"
       render :action => 'new'
     end
  end

  def index
    @reads = Read.all
  end


end
