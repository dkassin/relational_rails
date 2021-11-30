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

ActiveRecord::Schema.define(version: 2021_11_30_075329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mountain_ranges", force: :cascade do |t|
    t.string "name"
    t.boolean "has_ski_resort"
    t.integer "included_states"
  end

  create_table "mountains", force: :cascade do |t|
    t.string "name"
    t.boolean "volcanic"
    t.integer "elevation"
  end

  create_table "soccer_players", force: :cascade do |t|
    t.string "name"
    t.boolean "homegrown_player"
    t.integer "games_played"
  end

  create_table "soccer_teams", force: :cascade do |t|
    t.string "name"
    t.boolean "qualified_champ_league"
    t.integer "points"
  end

end
