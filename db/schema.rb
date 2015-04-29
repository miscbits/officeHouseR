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

ActiveRecord::Schema.define(version: 20150406031248) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "meeting_time"
    t.string   "meeting_location"
    t.integer  "teacher_id"
    t.boolean  "accepted"
    t.datetime "meeting_day"
  end

  create_table "availability_teachers", force: :cascade do |t|
    t.integer  "availability_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "course_id"
    t.string   "description"
    t.integer  "teacher_id"
  end

  create_table "courses_teachers", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "teacher_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "requests", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "message"
    t.integer "availability_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "department_id"
    t.string   "email"
    t.string   "bio"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "remember_token"
    t.string   "encrypted_password"
    t.string   "regular_hours"
    t.boolean  "admin",              default: false
    t.string   "office"
  end

  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree

end
