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

ActiveRecord::Schema.define(version: 2024_07_02_085547) do

  create_table "coffee_shops", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.float "rating"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "favorite_coffee_shop_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["favorite_coffee_shop_id"], name: "index_customers_on_favorite_coffee_shop_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "customer_id", null: false
    t.integer "coffee_shop_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coffee_shop_id"], name: "index_reviews_on_coffee_shop_id"
    t.index ["customer_id"], name: "index_reviews_on_customer_id"
  end

  add_foreign_key "customers", "favorite_coffee_shops"
  add_foreign_key "reviews", "coffee_shops"
  add_foreign_key "reviews", "customers"
end
