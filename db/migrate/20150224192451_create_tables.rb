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

  create_table  "pre_questionnaires", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_1"
    t.integer  "question_2"
    t.integer  "question_3"
    t.integer  "question_4"
    t.integer  "question_5"
    t.integer  "question_6"
    t.integer  "question_7"
    t.integer  "question_8"
    t.integer  "question_9"
    t.integer  "question_10"
    t.integer  "question_11"
    t.integer  "question_12"
    t.integer  "question_13"
    t.integer  "question_14"
    t.integer  "question_15"
  end

  create_table  "post_questionnaires", force: true do |t|
    t.integer  "user_id"
    t.integer  "question_1"
    t.integer  "question_2"
    t.integer  "question_3"
    t.integer  "question_4"
    t.integer  "question_5"
    t.integer  "question_6"
    t.integer  "question_7"
    t.integer  "question_8"
    t.integer  "question_9"
    t.integer  "question_10"
    t.integer  "question_11"
    t.integer  "question_12"
    t.integer  "question_13"
    t.integer  "question_14"
    t.integer  "question_15"
    t.integer  "question_16"
    t.integer  "question_17"
    t.integer  "question_18"
    t.integer  "question_19"
    t.integer  "question_20"
    t.text  "question_21"
    t.text  "question_22"
    t.text  "question_23"
    t.text  "question_24"
    t.text  "question_25"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "username"
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
    t.boolean  "tutorial_done", default: false
  end

  create_table "messages", force: true do |t|
    t.integer "sender_id"
    t.integer "receiver_id"
    t.string "message"
    t.boolean "seen", default: false, null: false
    t.boolean "invitation", default: false
    t.boolean "sceneinvitation", default: false
    t.integer "scene_id"
    t.datetime "sent_at"
  end
  end
end
