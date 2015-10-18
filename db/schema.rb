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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151018153459) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "finished"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "clinic_id"
  end

  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "pledges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.text     "text"
    t.integer  "rating_out_of_ten"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "pledges", ["project_id"], name: "index_pledges_on_project_id", using: :btree
  add_index "pledges", ["user_id"], name: "index_pledges_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "description"
    t.integer  "time_estimate"
    t.datetime "time_start"
    t.datetime "time_end"
    t.integer  "reward_monetary"
    t.text     "reward_non_monetary"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "appointments", "users"
  add_foreign_key "pledges", "projects"
  add_foreign_key "pledges", "users"
  add_foreign_key "projects", "users"
end
