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

ActiveRecord::Schema[7.2].define(version: 2026_09_26_105248) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clinics_on_user_id"
  end

  create_table "counseling_records", force: :cascade do |t|
    t.integer "treatment_area", null: false
    t.string "doctor"
    t.date "counseling_date", null: false
    t.integer "status", default: 0
    t.text "concerns"
    t.text "proposal_reason"
    t.integer "estimated_cost"
    t.integer "downtime"
    t.string "effect_duration"
    t.boolean "revision_guarantee", default: false
    t.integer "risk_disclosure_honesty"
    t.integer "proposal_satisfaction"
    t.text "notes"
    t.bigint "user_id", null: false
    t.bigint "clinic_id", null: false
    t.bigint "treatment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_counseling_records_on_clinic_id"
    t.index ["treatment_id"], name: "index_counseling_records_on_treatment_id"
    t.index ["user_id"], name: "index_counseling_records_on_user_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "clinics", "users"
  add_foreign_key "counseling_records", "clinics"
  add_foreign_key "counseling_records", "treatments"
  add_foreign_key "counseling_records", "users"
end
