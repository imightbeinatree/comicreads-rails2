class Read < ActiveRecord::Base
  belongs_to :issue
  validates_presence_of :issue_id, :read_date
end
