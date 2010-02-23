class AddOwnedToIssue < ActiveRecord::Migration
  def self.up
    add_column(:issues, :owned, :boolean)
  end

  def self.down
    remove_column(:issues, :owned)
  end
end
