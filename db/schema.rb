***REMOVED*** This file is auto-generated from the current state of the database. Instead
***REMOVED*** of editing this file, please use the migrations feature of Active Record to
***REMOVED*** incrementally modify your database, and then regenerate this schema definition.
***REMOVED***
***REMOVED*** Note that this schema.rb definition is the authoritative source for your
***REMOVED*** database schema. If you need to create the application database on another
***REMOVED*** system, you should be using db:schema:load, not running all the migrations
***REMOVED*** from scratch. The latter is a flawed and unsustainable approach (the more migrations
***REMOVED*** you'll amass, the slower it'll run and the greater likelihood for issues).
***REMOVED***
***REMOVED*** It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170708010640) do

  create_table "churches", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "group_id"
    t.string   "postal_code"
    t.integer  "prefecture_id"
    t.string   "address"
    t.decimal  "latitude",                        precision: 11, scale: 8
    t.decimal  "longitude",                       precision: 11, scale: 8
    t.string   "tel"
    t.string   "fax"
    t.string   "email"
    t.string   "url"
    t.text     "worshiping_time",   limit: 65535
    t.string   "top_image"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.datetime "soft_destroyed_at"
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id",                         null: false
    t.integer  "church_id",                       null: false
    t.text     "comment",           limit: 65535, null: false
    t.datetime "soft_destroyed_at"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["church_id"], name: "index_comments_on_church_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "soft_destroyed_at"
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "church_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.decimal  "latitude",          precision: 11, scale: 8
    t.decimal  "longitude",         precision: 11, scale: 8
    t.integer  "zoom_level"
    t.datetime "soft_destroyed_at"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "last_name"
    t.string   "first_name"
    t.integer  "church_id"
    t.integer  "gender"
    t.string   "icon"
    t.boolean  "is_test",                default: false, null: false
    t.datetime "soft_destroyed_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
