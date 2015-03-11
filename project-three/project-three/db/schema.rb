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

ActiveRecord::Schema.define(version: 20150310222848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "recommendations", force: :cascade do |t|
    t.string   "social_media"
    t.string   "handle"
    t.integer  "user_id_to"
    t.integer  "user_id"
    t.boolean  "is_funny"
    t.boolean  "is_food"
    t.boolean  "is_news"
    t.boolean  "is_fashion"
    t.boolean  "is_sports"
    t.boolean  "is_tv"
    t.boolean  "is_film"
    t.boolean  "is_music"
    t.boolean  "is_blog"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "user_first_name"
    t.string   "user_email"
    t.boolean  "is_private"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "avatar"
    t.boolean  "is_admin"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "is_current_user"
  end

end
