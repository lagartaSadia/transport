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

ActiveRecord::Schema[7.0].define(version: 2022_05_26_033339) do
  create_table "carriers", force: :cascade do |t|
    t.string "corporate_name"
    t.string "brand_name"
    t.string "domain"
    t.string "registered_number"
    t.string "full_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status", default: 0
  end

  create_table "delivery_times", force: :cascade do |t|
    t.integer "first_distance"
    t.integer "second_distance"
    t.integer "time"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_delivery_times_on_carrier_id"
  end

  create_table "prices", force: :cascade do |t|
    t.decimal "first_dimension"
    t.decimal "second_dimension"
    t.decimal "first_weight"
    t.decimal "second_weight"
    t.decimal "fee"
    t.decimal "minimal_fee"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_prices_on_carrier_id"
  end

  create_table "vehicles", force: :cascade do |t|
    t.string "license_plate"
    t.string "brand"
    t.string "vehicle_type"
    t.integer "fabrication_date"
    t.integer "capacity"
    t.integer "carrier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["carrier_id"], name: "index_vehicles_on_carrier_id"
  end

  add_foreign_key "delivery_times", "carriers"
  add_foreign_key "prices", "carriers"
  add_foreign_key "vehicles", "carriers"
end
