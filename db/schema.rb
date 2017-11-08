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

ActiveRecord::Schema.define(version: 20171108045247) do

  create_table "pids", force: :cascade do |t|
    t.string "hostname"
    t.string "Name"
    t.string "Description"
    t.string "ExecutablePath"
    t.string "ProcessId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "server_id"
    t.index ["server_id"], name: "index_pids_on_server_id"
  end

  create_table "servers", force: :cascade do |t|
    t.string "hostname"
    t.string "Caption"
    t.string "CSDVersion"
    t.string "BuildNumber"
    t.string "OSArchitecture"
    t.string "WindowsDirectory"
    t.string "OSLanguage"
    t.string "CurrentTimeZone"
    t.string "CountryCode"
    t.string "InstallDate"
    t.string "LastBootUpTime"
    t.string "LocalDateTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "hostname"
    t.string "Caption"
    t.string "Description"
    t.string "Disabled"
    t.string "FullName"
    t.string "LocalAccount"
    t.string "Lockout"
    t.string "Name"
    t.string "PasswordChangeable"
    t.string "PasswordExpires"
    t.string "PasswordRequired"
    t.string "SID"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "server_id"
    t.index ["server_id"], name: "index_users_on_server_id"
  end

end
