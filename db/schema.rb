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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161012184029) do

  create_table "articles", force: true do |t|
    t.string   "name"
    t.string   "code"
    t.string   "unit_of_measurement"
    t.float    "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sanitary_registry"
    t.string   "trademark"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "ruc"
    t.string   "address"
    t.string   "phone"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contract_details", force: true do |t|
    t.integer  "contract_id"
    t.integer  "article_id"
    t.float    "quantity"
    t.float    "unit_price"
    t.float    "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "missing_article"
  end

  create_table "contract_documents", force: true do |t|
    t.integer  "contract_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contracts", force: true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.string   "code"
    t.date     "date_of_issue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "final_price"
    t.float    "missing_payment"
  end

  create_table "purchase_order_details", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "purchase_order_id"
    t.integer  "article_id"
    t.float    "quantity"
    t.float    "unit_price"
    t.float    "total_price"
    t.date     "due_date"
    t.date     "production_date"
    t.string   "lote"
  end

  create_table "purchase_order_documents", force: true do |t|
    t.integer  "purchase_order_id"
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_orders", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
    t.string   "code"
    t.date     "date_of_issue"
    t.string   "billing_address"
    t.string   "delivery_address"
    t.date     "order_date"
    t.date     "delivery_date"
  end

  create_table "remission_guide_details", force: true do |t|
    t.integer  "remission_guide_id"
    t.integer  "article_id"
    t.float    "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "remission_guides", force: true do |t|
    t.integer  "client_id"
    t.integer  "transport_id"
    t.string   "code"
    t.string   "initial_point"
    t.string   "final_point"
    t.date     "date_of_issue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "ruc"
    t.string   "address"
    t.string   "phone"
    t.string   "contact"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transports", force: true do |t|
    t.string   "plate"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "trademark"
  end
=======
ActiveRecord::Schema.define(version: 20150922154528) do
>>>>>>> d430aa2ef6ecc00c903e6a56803c3a9bf9a7fc11

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
<<<<<<< HEAD
    t.string   "names"
=======
>>>>>>> d430aa2ef6ecc00c903e6a56803c3a9bf9a7fc11
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

<<<<<<< HEAD
  create_table "voucher_details", force: true do |t|
    t.integer  "voucher_id"
    t.integer  "article_id"
    t.float    "quantity"
    t.float    "unit_price"
    t.float    "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vouchers", force: true do |t|
    t.integer  "client_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date_of_issue"
  end

=======
>>>>>>> d430aa2ef6ecc00c903e6a56803c3a9bf9a7fc11
end
