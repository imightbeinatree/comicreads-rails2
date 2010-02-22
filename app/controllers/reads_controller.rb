class ReadsController < ApplicationController
  def new
    unless @read
      @read = Read.new
      @read.read_date = Time.now.strftime("%Y-%m-%d")
    end
  end

  def create
     @read = Read.new()
     @comic, @issue = @read.find_or_create_issue(params[:comic], params[:issue_num]) 
     @read.issue = @issue
     @read.read_date = params[:read][:read_date]
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
    @reads = Read.paginate(:page => params[:page], :order => 'read_date DESC, id DESC')
  end

  def destroy
    @read = Read.find params[:id]
    @read.destroy
    flash[:notice] = "read deleted"
    redirect_to reads_path
  end


end

