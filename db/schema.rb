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

ActiveRecord::Schema.define(version: 2019_03_20_163400) do

  create_table "friendships", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "resturant"
    t.string "category"
    t.text "menu"
    t.string "status"
    t.timestamp "date"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "user_groups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.index ["group_id"], name: "index_user_groups_on_group_id"
    t.index ["user_id"], name: "index_user_groups_on_user_id"
  end

  create_table "user_order_invitations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_user_order_invitations_on_order_id"
    t.index ["user_id"], name: "index_user_order_invitations_on_user_id"
  end

  create_table "user_order_participations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "order_id"
    t.string "item"
    t.text "comment"
    t.float "price"
    t.integer "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_user_order_participations_on_order_id"
    t.index ["user_id"], name: "index_user_order_participations_on_user_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "password"
    t.string "email"
    t.text "pic"
    t.text "facebook"
    t.text "google"
  end

  add_foreign_key "friendships", "users"
  add_foreign_key "friendships", "users", column: "friend_id"
  add_foreign_key "groups", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
  add_foreign_key "user_order_invitations", "orders"
  add_foreign_key "user_order_invitations", "users"
  add_foreign_key "user_order_participations", "orders"
  add_foreign_key "user_order_participations", "users"
end
