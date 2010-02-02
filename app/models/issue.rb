class Issue < ActiveRecord::Base
  belongs_to :comic
  belongs_to :issue_format
  has_many :reads
  validates_presence_of :issue_num, :comic_id
end
