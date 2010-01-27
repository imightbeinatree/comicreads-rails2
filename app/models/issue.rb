class Issue < ActiveRecord::Base
 has_one :comic
 validates_presence_of :issue_num, :comic_id
end
