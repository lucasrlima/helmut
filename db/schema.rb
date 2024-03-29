# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_06_14_022922) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.string "address"
    t.text "description"
    t.string "issue"
    t.string "owner"
    t.string "contact"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.time "time"
    t.boolean "done", default: false, null: false
    t.index ["user_id"], name: "index_jobs_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "skill_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "spending"
    t.float "total"
    t.index ["skill_id"], name: "index_payments_on_skill_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "first_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "last_name"
    t.string "role"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.bigint "job_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "fee"
    t.index ["job_id"], name: "index_skills_on_job_id"
    t.index ["profile_id"], name: "index_skills_on_profile_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "jobs", "users"
  add_foreign_key "payments", "skills"
  add_foreign_key "profiles", "users"
  add_foreign_key "skills", "jobs"
  add_foreign_key "skills", "profiles"
end
