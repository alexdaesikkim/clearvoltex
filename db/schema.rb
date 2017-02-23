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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20170223043107) do
=======
ActiveRecord::Schema.define(version: 20170221065219) do
>>>>>>> c4016af1e77e79065322c40b5977bed21cab2178

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "difficulties", force: :cascade do |t|
    t.integer  "song_id"
    t.string   "difficulty_name"
    t.integer  "level"
    t.string   "photo"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "tier"
<<<<<<< HEAD
    t.string   "effector"
    t.string   "song_name"
=======
    t.string   "effect"
  end

  create_table "songs", force: :cascade do |t|
    t.string   "song_name"
    t.string   "artist"
    t.string   "bpm"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
>>>>>>> c4016af1e77e79065322c40b5977bed21cab2178
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password_digest"
    t.string   "display_name"
    t.string   "email"
    t.string   "role"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "remember_digest"
  end

  create_table "userstats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "difficulty_id"
    t.string   "clear"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
<<<<<<< HEAD
    t.string   "score"
=======
>>>>>>> c4016af1e77e79065322c40b5977bed21cab2178
    t.string   "sort_string"
  end

end
