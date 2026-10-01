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

ActiveRecord::Schema[8.1].define(version: 2026_10_01_161029) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "users", force: :cascade do |t|
    t.decimal "wrist_circumference"
    t.string "size_preference"
    t.string "style_preference"
    t.decimal "budget"
    t.string "bracelet_preference"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "watches", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.string "reference"
    t.decimal "diameter"
    t.decimal "lug_to_lug"
    t.decimal "thickness"
    t.string "watch_type"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
