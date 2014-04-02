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

ActiveRecord::Schema.define(version: 20140402131815) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "movies", force: true do |t|
    t.string   "title"
    t.text     "plot"
    t.float    "rt_rating"
    t.string   "rt_url"
    t.float    "imdb_rating"
    t.string   "imdb_url"
    t.float    "metacritic_rating"
    t.string   "metacritic_url"
    t.string   "cast"
    t.date     "release_date"
    t.string   "director"
    t.string   "genre"
    t.string   "release_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.integer  "movie_id"
    t.string   "author"
    t.date     "date"
    t.string   "rating"
    t.string   "original_score"
    t.string   "source"
    t.text     "quote"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
