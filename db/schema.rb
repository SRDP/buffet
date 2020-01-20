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

ActiveRecord::Schema.define(version: 2020_01_17_091234) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dashboards", force: :cascade do |t|
    t.string "hostname"
    t.string "kernel_version"
    t.string "ipaddress"
    t.string "macaddress"
    t.string "cpuidle"
    t.string "total_memory"
    t.string "used_memory"
    t.string "free_memory"
    t.string "total_swap"
    t.string "used_swap"
    t.string "free_swap"
    t.string "userslist"
    t.string "disk_free_space"
    t.string "disk_Used_space"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
