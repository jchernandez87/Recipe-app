# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_07_222150) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_recipes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.bigint "recipes_id", null: false
    t.bigint "foods_id", null: false
    t.index ["foods_id"], name: "index_food_recipes_on_foods_id"
    t.index ["recipes_id"], name: "index_food_recipes_on_recipes_id"
  end

  create_table "foods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "measurement_unit"
    t.integer "price"
    t.bigint "users_id", null: false
    t.index ["users_id"], name: "index_foods_on_users_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.bigint "users_id", null: false
    t.string "description"
    t.index ["users_id"], name: "index_inventories_on_users_id"
  end

  create_table "inventories_foods", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "quantity"
    t.bigint "inventories_id", null: false
    t.bigint "foods_id", null: false
    t.index ["foods_id"], name: "index_inventories_foods_on_foods_id"
    t.index ["inventories_id"], name: "index_inventories_foods_on_inventories_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "preparation_time"
    t.string "cooking_time"
    t.text "description"
    t.boolean "public"
    t.bigint "users_id", null: false
    t.index ["users_id"], name: "index_recipes_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

