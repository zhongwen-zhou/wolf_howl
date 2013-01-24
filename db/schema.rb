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

ActiveRecord::Schema.define(:version => 20130124134608) do

  create_table "accounts", :force => true do |t|
    t.float    "sum"
    t.integer  "io_type"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "budget_type"
    t.integer  "budget_id"
    t.text     "remark"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "level"
    t.integer  "status"
    t.integer  "postion"
    t.integer  "parent_id"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "group_users", :force => true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.boolean  "is_admin"
    t.integer  "invitees_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "level"
    t.integer  "status"
    t.integer  "following_count"
    t.integer  "member_count"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "nick_name"
    t.string   "password"
    t.text     "brief_introduction"
    t.integer  "status"
    t.string   "access_token"
    t.datetime "token_updated_at"
    t.integer  "following_count"
    t.integer  "follower_count"
    t.integer  "group_count"
    t.integer  "sign_in_count"
    t.datetime "current_sign_in_at"
    t.string   "current_sign_in_ip"
    t.datetime "last_sign_in_at"
    t.string   "last_sign_in_ip"
    t.integer  "permission"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

end
