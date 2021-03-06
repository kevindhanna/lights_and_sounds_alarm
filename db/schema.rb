# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_17_193721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "light_groups", force: :cascade do |t|
    t.integer "hue_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hue_id"], name: "index_light_groups_on_hue_id", unique: true
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.string "action"
    t.string "time"
    t.integer "days"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigserial "light_group_id", null: false
    t.integer "duration"
    t.integer "brightness"
    t.index ["light_group_id"], name: "index_tasks_on_light_group_id"
  end

end
