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

ActiveRecord::Schema.define(version: 20160521224543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_infos", force: :cascade do |t|
    t.string   "description"
    t.integer  "resume_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "additional_infos", ["resume_id"], name: "index_additional_infos_on_resume_id", using: :btree

  create_table "education_accomplishments", force: :cascade do |t|
    t.string   "description"
    t.integer  "education_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "education_accomplishments", ["education_id"], name: "index_education_accomplishments_on_education_id", using: :btree

  create_table "educations", force: :cascade do |t|
    t.string   "school_name"
    t.string   "school_location"
    t.string   "major"
    t.string   "minor"
    t.string   "degree"
    t.decimal  "gpa"
    t.integer  "class_of"
    t.boolean  "is_enrolled"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "resume_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "educations", ["resume_id"], name: "index_educations_on_resume_id", using: :btree

  create_table "experience_duties", force: :cascade do |t|
    t.string   "description"
    t.integer  "experience_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "experience_duties", ["experience_id"], name: "index_experience_duties_on_experience_id", using: :btree

  create_table "experiences", force: :cascade do |t|
    t.string   "company"
    t.string   "position"
    t.string   "location"
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "is_employed"
    t.integer  "resume_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "experiences", ["resume_id"], name: "index_experiences_on_resume_id", using: :btree

  create_table "links", force: :cascade do |t|
    t.string   "description"
    t.string   "url"
    t.integer  "resume_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "links", ["resume_id"], name: "index_links_on_resume_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "objective"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "resumes", ["user_id"], name: "index_resumes_on_user_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.string   "title"
    t.integer  "resume_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "skills", ["resume_id"], name: "index_skills_on_resume_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "display_name"
    t.string   "street_address"
    t.string   "zip"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "additional_infos", "resumes"
  add_foreign_key "education_accomplishments", "educations"
  add_foreign_key "educations", "resumes"
  add_foreign_key "experience_duties", "experiences"
  add_foreign_key "experiences", "resumes"
  add_foreign_key "links", "resumes"
  add_foreign_key "resumes", "users"
  add_foreign_key "skills", "resumes"
end
