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

ActiveRecord::Schema.define(version: 20140905090442) do

  create_table "comments", force: true do |t|
    t.string  "body"
    t.string  "commit_id"
    t.string  "position"
    t.string  "path"
    t.string  "remote_id"
    t.integer "run_id"
  end

  add_index "comments", ["run_id"], name: "index_comments_on_run_id"

  create_table "pull_requests", force: true do |t|
    t.string  "remote_id"
    t.integer "repository_id"
  end

  add_index "pull_requests", ["repository_id"], name: "index_pull_requests_on_repository_id"

  create_table "repositories", force: true do |t|
    t.string "full_name"
  end

  create_table "runs", force: true do |t|
    t.string  "state"
    t.integer "pull_request_id"
  end

  add_index "runs", ["pull_request_id"], name: "index_runs_on_pull_request_id"

  create_table "users", force: true do |t|
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
