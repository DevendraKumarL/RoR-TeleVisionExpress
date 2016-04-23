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

ActiveRecord::Schema.define(version: 20160414031255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "category_name", null: false
  end

  create_table "episode_ratings", force: :cascade do |t|
    t.integer  "episodes_id"
    t.integer  "users_id"
    t.string   "username"
    t.float    "rating"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "episode_ratings", ["episodes_id"], name: "index_episode_ratings_on_episodes_id", using: :btree
  add_index "episode_ratings", ["users_id"], name: "index_episode_ratings_on_users_id", using: :btree

  create_table "episode_reviews", force: :cascade do |t|
    t.integer  "episodes_id"
    t.integer  "users_id"
    t.string   "username"
    t.text     "review"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "episode_reviews", ["episodes_id"], name: "index_episode_reviews_on_episodes_id", using: :btree
  add_index "episode_reviews", ["users_id"], name: "index_episode_reviews_on_users_id", using: :btree

  create_table "episodes", force: :cascade do |t|
    t.string   "episode_name"
    t.integer  "seasons_id"
    t.text     "episode_description"
    t.date     "air_date"
    t.integer  "rating"
    t.string   "image"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "episodes", ["seasons_id"], name: "index_episodes_on_seasons_id", using: :btree

  create_table "season_ratings", force: :cascade do |t|
    t.integer  "seasons_id"
    t.integer  "users_id"
    t.string   "username"
    t.float    "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "season_ratings", ["seasons_id"], name: "index_season_ratings_on_seasons_id", using: :btree
  add_index "season_ratings", ["users_id"], name: "index_season_ratings_on_users_id", using: :btree

  create_table "season_reviews", force: :cascade do |t|
    t.integer  "seasons_id"
    t.integer  "users_id"
    t.string   "username"
    t.text     "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "season_reviews", ["seasons_id"], name: "index_season_reviews_on_seasons_id", using: :btree
  add_index "season_reviews", ["users_id"], name: "index_season_reviews_on_users_id", using: :btree

  create_table "seasons", force: :cascade do |t|
    t.string   "season_name"
    t.integer  "tvshows_id"
    t.integer  "year"
    t.text     "season_overview"
    t.float    "rating"
    t.string   "image"
    t.text     "language"
    t.integer  "no_episodes"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "seasons", ["tvshows_id"], name: "index_seasons_on_tvshows_id", using: :btree

  create_table "tvshow_ratings", force: :cascade do |t|
    t.integer  "tvshows_id"
    t.integer  "users_id"
    t.string   "username"
    t.float    "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tvshow_ratings", ["tvshows_id"], name: "index_tvshow_ratings_on_tvshows_id", using: :btree
  add_index "tvshow_ratings", ["users_id"], name: "index_tvshow_ratings_on_users_id", using: :btree

  create_table "tvshow_reviews", force: :cascade do |t|
    t.integer  "tvshows_id"
    t.integer  "users_id"
    t.text     "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "username"
  end

  add_index "tvshow_reviews", ["tvshows_id"], name: "index_tvshow_reviews_on_tvshows_id", using: :btree
  add_index "tvshow_reviews", ["users_id"], name: "index_tvshow_reviews_on_users_id", using: :btree

  create_table "tvshows", force: :cascade do |t|
    t.string   "name"
    t.integer  "categories_id"
    t.integer  "year"
    t.string   "director"
    t.string   "language"
    t.text     "storyline"
    t.text     "cast"
    t.float    "rating"
    t.date     "aired_on"
    t.integer  "no_seasons"
    t.string   "image"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "tvshows", ["categories_id"], name: "index_tvshows_on_categories_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.text     "email"
  end

end
