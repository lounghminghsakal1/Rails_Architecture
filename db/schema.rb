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

ActiveRecord::Schema[8.1].define(version: 2026_11_19_112939) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "principal"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.check_constraint "char_length(name::text) >= 5", name: "college_name_check"
  end

  create_table "hostel_admin_profiles", force: :cascade do |t|
    t.integer "admin_level", null: false
    t.bigint "user_id", null: false
    t.bigint "hostel_id", null: false
    t.bigint "college_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_hostel_admin_profiles_on_college_id"
    t.index ["hostel_id"], name: "index_hostel_admin_profiles_on_hostel_id"
    t.index ["user_id"], name: "index_hostel_admin_profiles_on_user_id", unique: true
    t.check_constraint "admin_level > 0 AND admin_level < 6", name: "hostel_admin_level_check"
  end

  create_table "hostels", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.bigint "college_id", null: false
    t.string "director"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_hostels_on_college_id"
    t.check_constraint "char_length(name::text) >= 5", name: "hostel_name_check"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "room_number", null: false
    t.bigint "hostel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["room_number", "hostel_id"], name: "index_rooms_on_room_number_and_hostel_id", unique: true
  end

  create_table "student_profiles", force: :cascade do |t|
    t.string "roll_number", null: false
    t.string "department", null: false
    t.bigint "hostel_id", null: false
    t.bigint "college_id", null: false
    t.decimal "cgpa"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "room_id"
    t.index ["college_id"], name: "index_student_profiles_on_college_id"
    t.index ["hostel_id"], name: "index_student_profiles_on_hostel_id"
    t.index ["roll_number"], name: "index_student_profiles_on_roll_number", unique: true
    t.index ["room_id"], name: "index_student_profiles_on_room_id"
    t.index ["user_id"], name: "index_student_profiles_on_user_id", unique: true
    t.check_constraint "cgpa >= 0::numeric AND cgpa <= 10::numeric", name: "cgpa_check"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "password_hash"
    t.integer "role"
    t.bigint "college_id", null: false
    t.bigint "hostel_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_users_on_college_id"
    t.index ["hostel_id", "college_id"], name: "index_users_on_hostel_id_and_college_id"
    t.index ["hostel_id"], name: "index_users_on_hostel_id"
    t.check_constraint "char_length(name::text) >= 3", name: "user_name_check"
  end

  add_foreign_key "hostel_admin_profiles", "colleges"
  add_foreign_key "hostel_admin_profiles", "hostels"
  add_foreign_key "hostel_admin_profiles", "users"
  add_foreign_key "hostels", "colleges"
  add_foreign_key "rooms", "hostels"
  add_foreign_key "student_profiles", "colleges"
  add_foreign_key "student_profiles", "hostels"
  add_foreign_key "student_profiles", "rooms"
  add_foreign_key "student_profiles", "users"
  add_foreign_key "users", "colleges"
  add_foreign_key "users", "hostels"
end
