# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_07_071044) do

  create_table "course_subjects", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "status", default: 0
    t.bigint "course_id"
    t.bigint "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "fk_rails_e78a7f7f61"
    t.index ["subject_id"], name: "fk_rails_05edb1ba94"
  end

  create_table "course_users", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "status", default: 0
    t.bigint "course_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "fk_rails_e18783c035"
    t.index ["user_id"], name: "fk_rails_e90b3a1577"
  end

  create_table "courses", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.date "start_date"
    t.date "due_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
  end

  create_table "reports", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.date "date_report"
    t.string "do_today"
    t.string "problem"
    t.string "do_tomorrow"
    t.bigint "course_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_user_id"], name: "fk_rails_ef2e9bfa43"
  end

  create_table "subjects", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name_subject"
    t.string "description"
    t.integer "total_date_lean"
    t.date "start_date_learn"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name_task"
    t.bigint "subject_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["subject_id"], name: "fk_rails_60e05edfbf"
  end

  create_table "user_course_subjects", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.integer "status", default: 0
    t.bigint "course_subject_id"
    t.bigint "course_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_subject_id"], name: "fk_rails_8b34e54d19"
    t.index ["course_user_id"], name: "fk_rails_8873a3609d"
  end

  create_table "user_tasks", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.bigint "task_id"
    t.bigint "user_course_subject_id"
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "fk_rails_5a3f03c742"
    t.index ["user_course_subject_id"], name: "fk_rails_880914fea3"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_unicode_ci", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password"
    t.date "birthday"
    t.boolean "gender", default: false
    t.string "address"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "remember_digest"
  end

  add_foreign_key "course_subjects", "courses"
  add_foreign_key "course_subjects", "subjects"
  add_foreign_key "course_users", "courses"
  add_foreign_key "course_users", "users"
  add_foreign_key "reports", "course_users"
  add_foreign_key "tasks", "subjects"
  add_foreign_key "user_course_subjects", "course_subjects"
  add_foreign_key "user_course_subjects", "course_users"
  add_foreign_key "user_tasks", "tasks"
  add_foreign_key "user_tasks", "user_course_subjects"
end
