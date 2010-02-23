class ReadsController < ApplicationController
  def new
    unless @read
      @read = Read.new
      @read.read_date = Time.now.strftime("%Y-%m-%d")
    end
  end

  def create
     params[:owned] = (params[:owned].to_i == 1)  ? true : false
     curr_issue, last_issue = Issue.set_range_order(params[:issue_num],params[:range_end_issue_num], params[:range])
     while curr_issue <= last_issue
       params[:issue_num] = curr_issue
       @read = Read.make_read_from_params params
       if @read.save
       else
         flash[:error] = "Error Saving Read"
         render :action => 'new'
         break
       end
       curr_issue += 1
     end
     flash[:notice] = "Read(s) Saved!"
     redirect_to reads_path
  end

  def index
    @reads = Read.paginate(:page => params[:page], :order => 'read_date DESC, id DESC')
    @reads_count = Read.count
  end

  def destroy
    @read = Read.find params[:id]
    @read.destroy
    flash[:notice] = "read deleted"
    redirect_to reads_path
  end


end

