class CreateReads < ActiveRecord::Migration
  def self.up
    create_table :reads do |t|
      t.integer :issue_id
      t.date :read_date
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :reads
  end
end
