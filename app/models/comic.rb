class Comic < ActiveRecord::Base
  has_many :issues, :dependent => :destroy
  validates_presence_of :title
  cattr_reader :per_page
  @@per_page = 50

  def reads
    issues.inject(0){ |sum, i| sum += i.reads.count}
  end

  def issues_owned
    issues.count(:conditions => "owned = 't'")
  end
end
