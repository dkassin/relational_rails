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

ActiveRecord::Schema.define(version: 2021_12_01_043120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mountain_ranges", force: :cascade do |t|
    t.string "name"
    t.boolean "has_ski_resort"
    t.integer "included_states"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mountains", force: :cascade do |t|
    t.string "name"
    t.boolean "volcanic"
    t.integer "elevation"
    t.bigint "mountain_range_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mountain_range_id"], name: "index_mountains_on_mountain_range_id"
  end

  create_table "soccer_players", force: :cascade do |t|
    t.string "name"
    t.boolean "homegrown_player"
    t.integer "games_played"
    t.bigint "soccer_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["soccer_team_id"], name: "index_soccer_players_on_soccer_team_id"
  end

  create_table "soccer_teams", force: :cascade do |t|
    t.string "name"
    t.boolean "qualified_champ_league"
    t.integer "points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "mountains", "mountain_ranges"
  add_foreign_key "soccer_players", "soccer_teams"
end
