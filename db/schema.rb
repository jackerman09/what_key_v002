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

ActiveRecord::Schema.define(version: 20130912011204) do

  create_table "chordnotes", force: true do |t|
    t.integer  "note_id"
    t.integer  "chord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chords", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.boolean  "is_public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "chords", ["is_public"], name: "index_chords_on_is_public"

  create_table "keychords", force: true do |t|
    t.integer  "key_id"
    t.integer  "chord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "keys", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.boolean  "is_public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "keys", ["is_public"], name: "index_keys_on_is_public"

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "note_chords", force: true do |t|
    t.integer  "note_id"
    t.integer  "chord_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "note_in_chords", force: true do |t|
    t.integer  "chord_id"
    t.integer  "note_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "note_in_chords", ["chord_id", "note_id"], name: "index_note_in_chords_on_chord_id_and_note_id", unique: true
  add_index "note_in_chords", ["chord_id"], name: "index_note_in_chords_on_chord_id"
  add_index "note_in_chords", ["note_id"], name: "index_note_in_chords_on_note_id"

  create_table "notes", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
