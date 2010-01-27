class Read < ActiveRecord::Base
  has_one :issue
  validates_presence_of :issue_id, :read_date
end
