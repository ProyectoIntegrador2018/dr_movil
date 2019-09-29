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

ActiveRecord::Schema.define(version: 2019_09_29_161019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "doctors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "sex"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_doctors_on_email", unique: true
    t.index ["reset_password_token"], name: "index_doctors_on_reset_password_token", unique: true
  end

  create_table "logs", force: :cascade do |t|
    t.bigint "patient_medicals_id"
    t.float "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_medicals_id"], name: "index_logs_on_patient_medicals_id"
  end

  create_table "medical_variables", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_medicals", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "medical_variables_id"
    t.integer "freq"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_variables_id"], name: "index_patient_medicals_on_medical_variables_id"
    t.index ["patient_id"], name: "index_patient_medicals_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.string "sex"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "doctor_id"
    t.index ["doctor_id"], name: "index_patients_on_doctor_id"
    t.index ["email"], name: "index_patients_on_email", unique: true
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true
  end

  create_table "viewable_patients", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.index ["doctor_id"], name: "index_viewable_patients_on_doctor_id"
    t.index ["patient_id"], name: "index_viewable_patients_on_patient_id"
  end

  add_foreign_key "logs", "patient_medicals", column: "patient_medicals_id"
  add_foreign_key "patient_medicals", "medical_variables", column: "medical_variables_id"
  add_foreign_key "patient_medicals", "patients"
  add_foreign_key "patients", "doctors"
  add_foreign_key "viewable_patients", "doctors"
  add_foreign_key "viewable_patients", "patients"
end
