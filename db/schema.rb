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

  create_table "address_area", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=cp1251" do |t|
    t.string  "title",  limit: 150, default: "0", null: false
    t.integer "cityid",             default: -1,  null: false
  end

  create_table "address_city", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=cp1251" do |t|
    t.integer "country_id",             default: 1,   null: false
    t.string  "title",      limit: 150, default: "0", null: false
    t.integer "pos",                    default: 1
  end

end
