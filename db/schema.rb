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

ActiveRecord::Schema.define(version: 20151104120951) do

  create_table "developers", force: :cascade do |t|
    t.string   "developername"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "developers", ["email"], name: "index_developers_on_email", unique: true

  create_table "products", force: :cascade do |t|
    t.integer  "developer_id"
    t.string   "appname"
    t.text     "summary"
    t.text     "description"
    t.integer  "category"
    t.integer  "price"
    t.integer  "model"
    t.string   "img_icon"
    t.string   "img_screenshot_01"
    t.string   "img_screenshot_02"
    t.string   "img_screenshot_03"
    t.string   "img_screenshot_04"
    t.string   "img_screenshot_05"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "products", ["developer_id", "created_at"], name: "index_products_on_developer_id_and_created_at"
  add_index "products", ["developer_id"], name: "index_products_on_developer_id"

  create_table "users", force: :cascade do |t|
    t.string   "nickname"
    t.string   "email"
    t.string   "password_digest"
    t.string   "provider"
    t.string   "uid"
    t.string   "image_url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email", "provider", "uid"], name: "index_users_on_email_and_provider_and_uid", unique: true

end
