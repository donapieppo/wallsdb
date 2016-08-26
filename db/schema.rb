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

ActiveRecord::Schema.define(version: 0) do

  create_table "admins", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false, unsigned: true
    t.integer "wall_id", null: false, unsigned: true
    t.index ["user_id"], name: "user_id", using: :btree
    t.index ["wall_id"], name: "wall_id", using: :btree
  end

  create_table "openings", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "wall_id",     null: false, unsigned: true
    t.integer "day_of_week",              unsigned: true
    t.time    "time_open"
    t.time    "time_close"
    t.index ["wall_id"], name: "wall_id", using: :btree
  end

  create_table "photos", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "wall_id",                  null: false, unsigned: true
    t.text    "image",      limit: 65535
    t.integer "importance"
    t.index ["wall_id"], name: "wall_id", using: :btree
  end

  create_table "provinces", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "region_id"
    t.string "name",      limit: 128, null: false
    t.string "sig",       limit: 8,   null: false
  end

  create_table "regions", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
  end

  create_table "users", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "updated_at"
  end

  create_table "walls", unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",                      null: false
    t.text    "description", limit: 65535
    t.string  "address"
    t.string  "cap"
    t.text    "city",        limit: 65535
    t.integer "province_id",                            unsigned: true
    t.string  "map"
    t.text    "contact",     limit: 65535
    t.string  "web"
    t.text    "opening",     limit: 65535
    t.text    "prices",      limit: 65535
    t.integer "mq",                                     unsigned: true
    t.text    "boulder",     limit: 65535
    t.text    "rope",        limit: 65535
    t.text    "training",    limit: 65535
    t.text    "bar",         limit: 65535
    t.text    "music",       limit: 65535
    t.boolean "public"
    t.index ["province_id"], name: "province_id", using: :btree
  end

  add_foreign_key "admins", "users", name: "admins_ibfk_1"
  add_foreign_key "admins", "walls", name: "admins_ibfk_2"
  add_foreign_key "openings", "walls", name: "openings_ibfk_1"
  add_foreign_key "photos", "walls", name: "photos_ibfk_1"
  add_foreign_key "walls", "provinces", name: "walls_ibfk_1"
end
