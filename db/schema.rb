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

ActiveRecord::Schema[7.0].define(version: 2023_01_02_172944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "price_promotion_strategies", force: :cascade do |t|
    t.string "type"
    t.float "amount"
    t.integer "quantity_to_buy"
    t.integer "quantity_to_discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.integer "price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "price_promotion_strategy_id"
    t.index ["price_promotion_strategy_id"], name: "index_products_on_price_promotion_strategy_id"
  end

  add_foreign_key "products", "price_promotion_strategies"
end
