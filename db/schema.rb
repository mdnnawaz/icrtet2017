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
 
 
ActiveRecord::Schema.define(version: 20170501125201) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "journalpayments", force: :cascade do |t|
    t.string   "journal"
    t.integer  "amount"
    t.boolean  "isPaid",             default: false
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "paper_file_name"
    t.string   "paper_content_type"
    t.integer  "paper_file_size"
    t.datetime "paper_updated_at"
    t.string   "name"
    t.string   "ref_id"
    t.string   "paylink"
    t.index ["user_id"], name: "index_journalpayments_on_user_id", using: :btree
  end

  create_table "journals", force: :cascade do |t|
    t.boolean  "annexure_1"
    t.boolean  "others"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "mejsr"
    t.boolean  "wasj"
    t.boolean  "anas"
    t.boolean  "ijecs"
    t.boolean  "ijraset"
    t.index ["user_id"], name: "index_journals_on_user_id", using: :btree
  end

  create_table "papers", force: :cascade do |t|
    t.string   "paper_tile"
    t.text     "abstract"
    t.string   "type_of_conference"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.integer  "user_id"
    t.string   "paper_version1_file_name"
    t.string   "paper_version1_content_type"
    t.integer  "paper_version1_file_size"
    t.datetime "paper_version1_updated_at"
    t.string   "paper_version2_file_name"
    t.string   "paper_version2_content_type"
    t.integer  "paper_version2_file_size"
    t.datetime "paper_version2_updated_at"
    t.string   "paper_number"
    t.string   "author1"
    t.string   "author2"
    t.string   "author3"
    t.string   "status"
    t.boolean  "acc",                             default: false
    t.boolean  "rej",                             default: false
    t.boolean  "rev",                             default: false
    t.string   "camera_ready_paper_file_name"
    t.string   "camera_ready_paper_content_type"
    t.integer  "camera_ready_paper_file_size"
    t.datetime "camera_ready_paper_updated_at"
    t.string   "author4"
    t.string   "author5"
    t.boolean  "isReviewed",                      default: false
    t.index ["user_id"], name: "index_papers_on_user_id", using: :btree
  end

  create_table "payment_details", force: :cascade do |t|
    t.integer  "amount"
    t.string   "dd_number"
    t.string   "bank"
    t.string   "branch"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "dd_copy_file_name"
    t.string   "dd_copy_content_type"
    t.integer  "dd_copy_file_size"
    t.datetime "dd_copy_updated_at"
    t.integer  "user_id"
    t.string   "user_number"
    t.boolean  "accept"
    t.integer  "students",             default: 0,     null: false
    t.integer  "staff",                default: 0,     null: false
    t.string   "ref_id"
    t.boolean  "paid"
    t.string   "cust_id"
    t.integer  "cert",                 default: 0,     null: false
    t.boolean  "isPaid",               default: false
    t.string   "payUrl"
    t.string   "journal"
    t.index ["user_id"], name: "index_payment_details_on_user_id", using: :btree
  end

  create_table "tests", force: :cascade do |t|
    t.boolean  "vijay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "mobile_number"
    t.string   "college_name"
    t.string   "designation"
    t.boolean  "verified",               default: false
    t.boolean  "is_verified",            default: false
    t.string   "verification_code"
    t.boolean  "admin",                  default: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "verifications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verify_pins", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "journalpayments", "users"
  add_foreign_key "journals", "users"
  add_foreign_key "papers", "users"
  add_foreign_key "payment_details", "users"
end
