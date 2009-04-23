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

ActiveRecord::Schema.define(:version => 20090423105256) do

  create_table "assignments", :force => true do |t|
    t.string   "name",       :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "criteria", :force => true do |t|
    t.string   "title",         :default => ""
    t.text     "help",          :default => ""
    t.integer  "worth",         :default => 0
    t.integer  "assignment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", :force => true do |t|
    t.integer  "student_id"
    t.integer  "assignment_id"
    t.text     "comment",       :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marks", :force => true do |t|
    t.integer  "criterion_id"
    t.integer  "value",        :default => 0
    t.text     "comment",      :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "grade_id"
  end

  create_table "students", :force => true do |t|
    t.string   "name",       :default => ""
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",      :default => ""
  end

end
