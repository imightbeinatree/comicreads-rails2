class Comic < ActiveRecord::Base
  has_many :issues
  validates_presence_of :title
end
