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

ActiveRecord::Schema.define(:version => 20100419201027) do

  create_table "courses", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.string   "address"
    t.integer  "par",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hole_informations", :force => true do |t|
    t.string   "color"
    t.integer  "distance"
    t.integer  "hole_id"
    t.integer  "difficulty"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holes", :force => true do |t|
    t.integer  "position",    :null => false
    t.integer  "par",         :null => false
    t.string   "description"
    t.integer  "handicap",    :null => false
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
