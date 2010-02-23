class ReadsController < ApplicationController
  def new
    unless @read
      @read = Read.new
      @read.read_date = Time.now.strftime("%Y-%m-%d")
    end
  end

  def create
     if params[:range] == 'yes' and (not params[:issue_num].blank?) and (not params[:range_end_issue_num].blank?)
       if params[:issue_num].to_i < params[:range_end_issue_num].to_i
         curr_issue = params[:issue_num].to_i
         last_issue = params[:range_end_issue_num].to_i
       else
         curr_issue = params[:range_end_issue_num].to_i
         last_issue = params[:issue_num].to_i
       end
       while curr_issue <= last_issue
         params[:issue_num] = curr_issue
         @read = Read.new()
         @comic, @issue = @read.find_or_create_issue(params[:comic], params[:issue_num]) 
         @read.issue = @issue
         @read.read_date = params[:read][:read_date]
         @read.notes = params[:notes]
      puts @read.inspect
         if @read.save
         else
           flash[:error] = "Error Saving Read"
           render :action => 'new'
           break
         end
         curr_issue += 1
       end
       flash[:notice] = "Read Saved!"
       redirect_to reads_path
     else
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

