class ReadsController < ApplicationController
  def new
  end

  def create
     @read = Read.new()
     @comic, @issue = @read.find_or_create_issue(params[:comic], params[:issue_num]) 
puts @comic.inspect
puts @issue.inspect
     @read.issue = @issue
     @read.read_date = params[:read_date][:read_date]
     @read.notes = params[:notes]
puts @read.inspect
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
