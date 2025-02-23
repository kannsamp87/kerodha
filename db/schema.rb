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

ActiveRecord::Schema.define(version: 20201207064135) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "stocks", force: :cascade do |t|
    t.string   "name"
    t.string   "identifier"
    t.string   "type"
    t.decimal  "base_price"
    t.decimal  "ltp"
    t.decimal  "high"
    t.decimal  "low"
    t.decimal  "open"
    t.decimal  "close"
    t.boolean  "delisted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type", "identifier"], name: "index_stocks_on_type_and_identifier", unique: true
  end

  create_table "user_stocks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "stock_id"
    t.integer "quantity"
    t.string  "type"
    t.decimal "average_price"
    t.index ["user_id", "stock_id"], name: "index_user_stocks_on_user_id_and_stock_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "is_verified"
    t.boolean  "deactivated"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "watchlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "stock_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
