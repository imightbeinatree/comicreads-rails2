class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.string :issue_num
      t.integer :comic_id

      t.timestamps
    end
  end

  def self.down
    drop_table :issues
  end
end
