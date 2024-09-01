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

ActiveRecord::Schema[7.2].define(version: 2024_08_25_145503) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "description", null: false
    t.decimal "value", precision: 15, scale: 2, null: false
    t.datetime "due_date"
    t.uuid "entry_type_id", null: false
    t.uuid "user_id", null: false
    t.uuid "entry_category_id"
    t.uuid "monthly_budget_id", null: false
    t.uuid "yearly_budget_id", null: false
    t.uuid "entry_status_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entry_category_id"], name: "index_entries_on_entry_category_id"
    t.index ["entry_status_id"], name: "index_entries_on_entry_status_id"
    t.index ["entry_type_id"], name: "index_entries_on_entry_type_id"
    t.index ["monthly_budget_id"], name: "index_entries_on_monthly_budget_id"
    t.index ["user_id"], name: "index_entries_on_user_id"
    t.index ["yearly_budget_id"], name: "index_entries_on_yearly_budget_id"
  end

  create_table "entry_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entry_statuses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_entry_statuses_on_key", unique: true
  end

  create_table "entry_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_entry_types_on_key", unique: true
  end

  create_table "monthly_budgets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "year", null: false
    t.string "month", null: false
    t.uuid "user_id", null: false
    t.uuid "yearly_budget_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "yearly_budget_id", "year", "month"], name: "idx_on_user_id_yearly_budget_id_year_month_6f6a90a555", unique: true
    t.index ["user_id"], name: "index_monthly_budgets_on_user_id"
    t.index ["yearly_budget_id"], name: "index_monthly_budgets_on_yearly_budget_id"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
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

  create_table "yearly_budgets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "year", null: false
    t.uuid "user_id", null: false
    t.string "month_prefixes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "year"], name: "index_yearly_budgets_on_user_id_and_year", unique: true
    t.index ["user_id"], name: "index_yearly_budgets_on_user_id"
  end

  add_foreign_key "entries", "entry_categories"
  add_foreign_key "entries", "entry_statuses"
  add_foreign_key "entries", "entry_types"
  add_foreign_key "entries", "monthly_budgets"
  add_foreign_key "entries", "users"
  add_foreign_key "entries", "yearly_budgets"
  add_foreign_key "monthly_budgets", "users"
  add_foreign_key "monthly_budgets", "yearly_budgets"
  add_foreign_key "yearly_budgets", "users"
end
