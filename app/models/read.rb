class Read < ActiveRecord::Base
  belongs_to :issue
  validates_presence_of :issue_id, :read_date
  cattr_reader :per_page
  @@per_page = 10

  def find_or_create_issue(comic_title, issue_num)
     comic = Comic.find_by_title(comic_title)
     if comic
       issue = Issue.find_by_issue_num_and_comic_id(:issue_num,comic.id)
     else
       comic = Comic.create(:title => comic_title)
       issue = Issue.find_by_issue_num_and_comic_id(issue_num,comic.id)
     end
     unless issue
       issue = Issue.create(:issue_num => issue_num, :comic_id => comic.id)
     end
     [comic, issue]
  end

end
