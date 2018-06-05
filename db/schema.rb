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

ActiveRecord::Schema.define(version: 20180520001246) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "content", null: false
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "frameworks", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "help_types", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string "skill_level", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.string "likeable_type"
    t.bigint "likeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable_type_and_likeable_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.bigint "help_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["help_type_id"], name: "index_questions_on_help_type_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tutorial_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["tutorial_id"], name: "index_taggings_on_tutorial_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name"
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "website", null: false
    t.string "author_name"
    t.bigint "framework_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "skill_level", null: false
    t.bigint "hunter_id"
    t.bigint "author_id"
    t.string "slug"
    t.index ["author_id"], name: "index_tutorials_on_author_id"
    t.index ["framework_id"], name: "index_tutorials_on_framework_id"
    t.index ["hunter_id"], name: "index_tutorials_on_hunter_id"
    t.index ["slug"], name: "index_tutorials_on_slug"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName", null: false
    t.string "lastName", null: false
    t.string "username", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "photoURL", null: false
    t.string "headline"
    t.string "uid"
    t.string "providerId"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["username"], name: "index_users_on_username"
  end

  add_foreign_key "comments", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "questions", "help_types"
  add_foreign_key "taggings", "tags"
  add_foreign_key "taggings", "tutorials"
  add_foreign_key "tutorials", "frameworks"
end
