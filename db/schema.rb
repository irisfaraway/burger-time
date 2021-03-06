# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160512181822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "burgers", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "spicy"
    t.decimal  "price_single"
    t.decimal  "price_double"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "burgers_orders", id: false, force: :cascade do |t|
    t.integer "burger_id", null: false
    t.integer "order_id",  null: false
  end

  add_index "burgers_orders", ["burger_id", "order_id"], name: "index_burgers_orders_on_burger_id_and_order_id", using: :btree
  add_index "burgers_orders", ["order_id", "burger_id"], name: "index_burgers_orders_on_order_id_and_burger_id", using: :btree

  create_table "dips", force: :cascade do |t|
    t.string   "name"
    t.boolean  "spicy"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dips_orders", id: false, force: :cascade do |t|
    t.integer "dip_id",   null: false
    t.integer "order_id", null: false
  end

  add_index "dips_orders", ["dip_id", "order_id"], name: "index_dips_orders_on_dip_id_and_order_id", using: :btree
  add_index "dips_orders", ["order_id", "dip_id"], name: "index_dips_orders_on_order_id_and_dip_id", using: :btree

  create_table "drinks", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drinks_orders", id: false, force: :cascade do |t|
    t.integer "drink_id", null: false
    t.integer "order_id", null: false
  end

  add_index "drinks_orders", ["drink_id", "order_id"], name: "index_drinks_orders_on_drink_id_and_order_id", using: :btree
  add_index "drinks_orders", ["order_id", "drink_id"], name: "index_drinks_orders_on_order_id_and_drink_id", using: :btree

  create_table "fillings", force: :cascade do |t|
    t.string   "name"
    t.boolean  "spicy"
    t.decimal  "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fillings_orders", id: false, force: :cascade do |t|
    t.integer "filling_id", null: false
    t.integer "order_id",   null: false
  end

  add_index "fillings_orders", ["filling_id", "order_id"], name: "index_fillings_orders_on_filling_id_and_order_id", using: :btree
  add_index "fillings_orders", ["order_id", "filling_id"], name: "index_fillings_orders_on_order_id_and_filling_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "eater"
    t.date     "order_date"
    t.decimal  "order_price"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "size"
    t.string   "comment"
    t.decimal  "amount_paid"
    t.decimal  "payment_remainder"
  end

  create_table "orders_sides", id: false, force: :cascade do |t|
    t.integer "side_id",  null: false
    t.integer "order_id", null: false
  end

  add_index "orders_sides", ["order_id", "side_id"], name: "index_orders_sides_on_order_id_and_side_id", using: :btree
  add_index "orders_sides", ["side_id", "order_id"], name: "index_orders_sides_on_side_id_and_order_id", using: :btree

  create_table "sides", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "spicy"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
