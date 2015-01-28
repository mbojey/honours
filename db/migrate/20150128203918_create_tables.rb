class CreateTables < ActiveRecord::Migration
  def change
    create_table "actions", force: true do |t|
    t.integer  "creator_id",   default: 0, null: false
    t.integer  "scene_id",     default: 0, null: false
    t.integer  "scene_count",  default: 0, null: false
    t.integer  "start_x"
    t.integer  "start_y"
    t.integer  "end_x"
    t.integer  "end_y"
    t.datetime "performed_at"
  end

  create_table "nodes", force: true do |t|
    t.integer  "creator_id",             default: 0, null: false
    t.integer  "scene_id",               default: 0, null: false
    t.boolean  "next_pointer"
    t.boolean  "prev_pointer"
    t.integer  "next_pointer_target_id", default: 0, null: false
    t.integer  "prev_pointer_target_id"
    t.string   "datatype1"
    t.string   "data1"
    t.string   "datatype2"
    t.string   "data2"
    t.datetime "created_at"
    t.integer  "scene_count", default: 0, null: false
    t.boolean  "head"
    t.integer  "x"
    t.integer  "y"
    t.boolean  "temp", default: false, null: false
    t.boolean  "visible", default: true, null: false
  end

  create_table "scenes", force: true do |t|
    t.integer  "creator_id",        default: 0, null: false
    t.integer  "collab_id", default: 0, null: false
    t.datetime "created_at"
    t.integer  "question"
    t.integer  "step"
    t.boolean  "correct"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email",                  default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "fname"
    t.string   "lname"
    t.string   "lab"
    t.integer  "studentnumber"
    t.datetime "last_seen_at"
    t.boolean  "available", default: true, null: false
    t.integer  "partner_id"
    t.integer  "current_scene"
    t.boolean  "pending_invitation", default: false, null: false
    t.integer  "inviter"
  end

  create_table "messages", force: true do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "message"
    t.boolean "seen", default: false, null: false
    t.datetime "sent_at"
  end
  end
end
