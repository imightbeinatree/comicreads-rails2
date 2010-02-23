class Read < ActiveRecord::Base
  belongs_to :issue
  validates_presence_of :issue_id, :read_date
  cattr_reader :per_page
  @@per_page = 50

  def find_or_create_issue(comic_title, issue_num, owned)
     comic = Comic.find_by_title(comic_title)
     if comic
       issue = Issue.find_by_issue_num_and_comic_id(issue_num,comic.id)
     else
       comic = Comic.create(:title => comic_title)
       issue = Issue.find_by_issue_num_and_comic_id(issue_num,comic.id)
     end
     if owned and issue and (not issue.owned)
       issue.owned = owned
       issue.save
     end
     unless issue
       issue = Issue.create(:issue_num => issue_num, :comic_id => comic.id, :owned => owned)
     end
     [comic, issue]
  end

  def self.make_read_from_params(params)
    puts params
     @read = Read.new()
     @comic, @issue = @read.find_or_create_issue(params[:comic], params[:issue_num], params[:owned])
     @read.issue = @issue
     @read.read_date = params[:read][:read_date]
     @read.notes = params[:notes]
     @read
  end
end
