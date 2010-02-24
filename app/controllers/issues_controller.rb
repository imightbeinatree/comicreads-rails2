class IssuesController < ApplicationController
  def destroy
    @issue = Issue.find params[:id]
    @issue.destroy
    flash[:notice] = "issue deleted"
    redirect_to comic_path @issue.comic
  end

  def show
    @issue = Issue.find params[:id]
  end

end
