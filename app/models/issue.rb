class Issue < ActiveRecord::Base
  has_one :comic
  has_one :issue_format
  has_many :reads
  validates_presence_of :issue_num, :comic_id
end
