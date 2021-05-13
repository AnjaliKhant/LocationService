# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_13_125700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "places", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.string "name"
    t.string "zip_code", limit: 10
    t.string "address"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["latitude"], name: "index_places_on_latitude"
    t.index ["longitude"], name: "index_places_on_longitude"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "place_id", null: false
    t.string "tag_0", limit: 50
    t.string "tag_1", limit: 50
    t.string "tag_2", limit: 50
    t.string "tag_3", limit: 50
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["place_id"], name: "index_tags_on_place_id"
    t.index ["tag_0"], name: "index_tags_on_tag_0"
    t.index ["tag_1"], name: "index_tags_on_tag_1"
  end

  add_foreign_key "tags", "places"
end
