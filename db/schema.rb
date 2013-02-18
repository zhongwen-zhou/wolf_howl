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

ActiveRecord::Schema.define(:version => 20130128090421) do

  create_table "accounts", :force => true do |t|
    t.float    "sum",                           :null => false
    t.integer  "io_type"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "genre_type"
    t.integer  "genre_id"
    t.text     "remark"
    t.integer  "visable_status", :default => 0, :null => false
    t.integer  "user_id",                       :null => false
    t.integer  "paid_user_id",                  :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "activities", :force => true do |t|
    t.string   "subject",                       :null => false
    t.text     "description"
    t.string   "address"
    t.integer  "status",         :default => 0, :null => false
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "visable_status", :default => 0, :null => false
    t.integer  "user_id",                       :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "activity_users", :force => true do |t|
    t.integer  "activity_id",                           :null => false
    t.integer  "user_id",                               :null => false
    t.integer  "invitees_id"
    t.boolean  "is_admin",           :default => false
    t.integer  "status",             :default => 0,     :null => false
    t.float    "last_paid_account"
    t.float    "last_total_account"
    t.datetime "last_joined_time"
    t.datetime "last_left_time"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

  create_table "budgets", :force => true do |t|
    t.string   "name",                          :null => false
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "visable_status", :default => 0, :null => false
    t.integer  "status",         :default => 0, :null => false
    t.float    "total_sum"
    t.float    "balance_sum"
    t.integer  "genre_id"
    t.string   "genre_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.integer  "user_id",                       :null => false
    t.integer  "parent_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "categories", :force => true do |t|
    t.string   "name",                       :null => false
    t.text     "description"
    t.integer  "level",       :default => 0
    t.integer  "status",      :default => 0, :null => false
    t.integer  "postion",     :default => 0
    t.integer  "max_postion"
    t.integer  "parent_id"
    t.integer  "user_id",                    :null => false
    t.integer  "io_type",     :default => 0, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "group_users", :force => true do |t|
    t.integer  "group_id",                       :null => false
    t.integer  "user_id",                        :null => false
    t.integer  "invitees_id"
    t.boolean  "is_follow",   :default => false
    t.boolean  "is_admin",    :default => false
    t.boolean  "is_creator",  :default => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name",                           :null => false
    t.text     "description"
    t.integer  "level",           :default => 1
    t.integer  "status",          :default => 0, :null => false
    t.integer  "following_count", :default => 0
    t.integer  "member_count",    :default => 0
    t.integer  "user_id",                        :null => false
    t.integer  "visable_status",  :default => 0, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :null => false
    t.string   "nick_name",                             :null => false
    t.string   "password",                              :null => false
    t.text     "brief_introduction"
    t.integer  "status",             :default => 0,     :null => false
    t.string   "access_token"
    t.datetime "token_updated_at"
    t.integer  "following_count",    :default => 0
    t.integer  "follower_count",     :default => 0
    t.integer  "group_count",        :default => 0
    t.integer  "sign_in_count",      :default => 0
    t.datetime "current_sign_in_at"
    t.string   "current_sign_in_ip"
    t.datetime "last_sign_in_at"
    t.string   "last_sign_in_ip"
    t.integer  "permission",         :default => 1,     :null => false
    t.boolean  "is_remember",        :default => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

end
