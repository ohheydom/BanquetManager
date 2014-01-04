# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140104012718) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "guests_of_honor"
    t.date     "date_of_event"
    t.date     "date_booked"
    t.string   "type_of_event"
    t.integer  "minimum_guarantee"
    t.integer  "amount_of_guests"
    t.decimal  "base_price"
    t.decimal  "additional_charges"
    t.decimal  "deposit"
    t.date     "payment_1_date"
    t.date     "payment_2_date"
    t.date     "final_payment_date"
    t.decimal  "payment_1"
    t.decimal  "payment_2"
    t.date     "menu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
