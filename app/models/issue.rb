class Issue < ActiveRecord::Base
  belongs_to :comic
  belongs_to :issue_format
  has_many :reads
  validates_presence_of :issue_num, :comic_id


  def self.set_range_order(issue_num,range_end_issue_num=nil,range='no')
    if range == 'yes' and (not issue_num.blank?) and (not range_end_issue_num.nil?)
      if issue_num.to_i < range_end_issue_num.to_i
        curr_issue = issue_num.to_i
        last_issue = range_end_issue_num.to_i
      else
        curr_issue = range_end_issue_num.to_i
        last_issue = issue_num.to_i
      end
    else
     curr_issue, last_issue = issue_num.to_i, issue_num.to_i
    end
    [curr_issue, last_issue]
  end

end
