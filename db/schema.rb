# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100127042038) do

  create_table "comics", :force => true do |t|
    t.string   "title"
    t.string   "year_started", :limit => 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "publisher"
  end

  create_table "issue_formats", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "issues", :force => true do |t|
    t.string   "issue_num"
    t.integer  "comic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "issue_format_id"
  end

  create_table "reads", :force => true do |t|
    t.integer  "issue_id"
    t.date     "read_date"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
