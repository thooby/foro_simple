# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121221184334) do

  create_table "frm_categories", :force => true do |t|
    t.string   "title"
    t.boolean  "state",      :default => true
    t.integer  "position",   :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "frm_forums", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.boolean  "state",            :default => true
    t.integer  "frm_topics_count", :default => 0
    t.integer  "frm_posts_count",  :default => 0
    t.integer  "position",         :default => 0
    t.integer  "frm_category_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "frm_posts", :force => true do |t|
    t.text     "body"
    t.integer  "frm_forum_id"
    t.integer  "frm_topic_id"
    t.integer  "user_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "frm_topics", :force => true do |t|
    t.string   "title"
    t.integer  "hits",            :default => 0
    t.boolean  "sticky",          :default => false
    t.boolean  "locked",          :default => false
    t.integer  "frm_posts_count"
    t.integer  "frm_forum_id"
    t.integer  "user_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "frm_topics_count", :default => 0
    t.integer  "frm_posts_count",  :default => 0
  end

end
