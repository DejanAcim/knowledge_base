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

ActiveRecord::Schema.define(version: 20171119100723) do

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.integer "training_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["training_plan_id"], name: "index_comments_on_training_plan_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.boolean "like"
    t.integer "user_id"
    t.integer "training_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
  end

  create_table "training_plan_skills", force: :cascade do |t|
    t.integer "skill_id"
    t.integer "training_plan_id"
  end

  create_table "training_plan_trainings", force: :cascade do |t|
    t.integer "training_id"
    t.integer "training_plan_id"
  end

  create_table "training_plans", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_training_plans_on_user_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "email"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

end
