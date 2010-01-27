class AddFormatToIssue < ActiveRecord::Migration
  def self.up
    add_column :issues, :issue_format_id, :integer
  end

  def self.down
    remove_column :issues, :issue_format_id
  end
end
