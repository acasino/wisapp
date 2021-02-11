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

ActiveRecord::Schema.define(version: 2021_02_11_055450) do

  create_table "offers", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.float "sender_offer_price"
    t.datetime "timestamp"
    t.string "transaction_id"
    t.string "status"
    t.integer "wanted_id"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receiver_id"], name: "index_offers_on_receiver_id"
    t.index ["sender_id"], name: "index_offers_on_sender_id"
    t.index ["wanted_id"], name: "index_offers_on_wanted_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.text "profile"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userwatches", force: :cascade do |t|
    t.integer "user_id"
    t.integer "watch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_userwatches_on_user_id"
    t.index ["watch_id"], name: "index_userwatches_on_watch_id"
  end

  create_table "watches", force: :cascade do |t|
    t.string "name"
    t.string "dimensions"
    t.text "description"
    t.float "price"
    t.string "avatar"
    t.string "brand"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand"], name: "index_watches_on_brand"
    t.index ["genre"], name: "index_watches_on_genre"
  end

end
