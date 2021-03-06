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

ActiveRecord::Schema.define(version: 20180315144014) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "package_sku"
    t.integer "amount_cents", default: 0, null: false
    t.jsonb "payment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "packages", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.string "sku"
    t.integer "maxlist"
    t.integer "maxport"
  end

  create_table "portals", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "portal_url"
    t.boolean "premium"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "properties", force: :cascade do |t|
    t.string "address"
    t.string "price"
    t.text "description"
    t.string "photo"
    t.string "prop_url"
    t.text "XML"
    t.text "HTML"
    t.bigint "user_id"
    t.bigint "portal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["portal_id"], name: "index_properties_on_portal_id"
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "portal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "price_cents", default: 0, null: false
    t.index ["portal_id"], name: "index_transactions_on_portal_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "comp_name"
    t.string "comp_url"
    t.string "phone_number"
    t.string "address"
    t.string "user"
    t.bigint "package_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["package_id"], name: "index_users_on_package_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "properties", "portals"
  add_foreign_key "properties", "users"
  add_foreign_key "transactions", "portals"
  add_foreign_key "transactions", "users"
  add_foreign_key "users", "packages"
end
