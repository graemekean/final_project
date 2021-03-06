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

ActiveRecord::Schema.define(version: 20160126121704) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "state"
    t.boolean  "approved"
  end

  add_index "friendships", ["state"], name: "index_friendships_on_state", using: :btree
  add_index "friendships", ["user_id", "friend_id"], name: "index_friendships_on_user_id_and_friend_id", using: :btree

  create_table "group_memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_memberships", ["user_id", "group_id"], name: "index_group_memberships_on_user_id_and_group_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "creator"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["user_id", "project_id"], name: "index_memberships_on_user_id_and_project_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "mixers", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mixes", force: :cascade do |t|
    t.integer  "project_id"
    t.string   "title"
    t.string   "file_name"
    t.integer  "user_id"
    t.string   "instrument"
    t.decimal  "bpm"
    t.string   "key"
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_name"
    t.string   "youtube_url"
    t.string   "profile_image"
    t.string   "profile_video"
    t.string   "about_me"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
    t.string   "soundcloud_url"
    t.string   "linkedin_url"
    t.string   "influences"
    t.string   "genres"
    t.string   "role"
    t.string   "primary_discipline"
    t.string   "city"
    t.string   "featured_track"
    t.string   "featured_playlist"
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title"
    t.decimal  "bpm"
    t.string   "key"
    t.string   "creator"
    t.string   "genre"
    t.boolean  "public"
    t.boolean  "editable"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.boolean  "published"
    t.datetime "published_at"
    t.string   "preview_url"
    t.integer  "user_id"
    t.datetime "updated_at",   null: false
    t.integer  "studio_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "video"
    t.string   "sound"
  end

  create_table "stems", force: :cascade do |t|
    t.string   "description"
    t.string   "key"
    t.decimal  "bpm"
    t.string   "instrument"
    t.datetime "date_created"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "membership_id"
  end

  create_table "studios", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "profile_name"
    t.string   "soundcloud_url"
    t.string   "youtube_url"
    t.string   "linkedin_url"
    t.string   "role"
    t.string   "profile_image"
    t.string   "profile_video"
    t.string   "about_me"
    t.string   "primary_skill"
    t.string   "twitter_feed"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.string   "author"
    t.string   "duration"
    t.integer  "likes"
    t.integer  "dislikes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
