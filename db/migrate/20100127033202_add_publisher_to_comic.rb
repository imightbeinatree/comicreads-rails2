class AddPublisherToComic < ActiveRecord::Migration
  def self.up
    add_column :comics, :publisher, :string
  end

  def self.down
    remove_column :comics, :publisher
  end
end
