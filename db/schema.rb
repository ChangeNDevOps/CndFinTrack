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

ActiveRecord::Schema[8.1].define(version: 2026_08_08_203815) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.datetime "updated_at", null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "position", default: 0, null: false
    t.integer "status"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_categories_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "country_code"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "prefix"
    t.string "province_code"
    t.integer "status"
    t.bigint "team_id", null: false
    t.string "tps_id"
    t.string "tvq_id"
    t.datetime "updated_at", null: false
    t.string "zip"
    t.index ["team_id"], name: "index_companies_on_team_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.bigint "company_id", null: false
    t.string "country_code"
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "prefix"
    t.string "province_code"
    t.integer "status"
    t.boolean "taxable", default: true
    t.datetime "updated_at", null: false
    t.string "zip"
    t.index ["company_id"], name: "index_customers_on_company_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.date "invoiced_on"
    t.string "name"
    t.date "paid_on"
    t.bigint "supplier_id", null: false
    t.boolean "taxable", default: true
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_expenses_on_company_id"
    t.index ["supplier_id"], name: "index_expenses_on_supplier_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "due_on"
    t.date "invoiced_on"
    t.bigint "quote_id", null: false
    t.boolean "taxable", default: true
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.index ["quote_id"], name: "index_invoices_on_quote_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.bigint "invoice_id", null: false
    t.date "paid_on"
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.index ["invoice_id"], name: "index_payments_on_invoice_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "category_price"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.string "description"
    t.string "name"
    t.integer "status"
    t.decimal "unit_price", precision: 10, scale: 2
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_products_on_company_id"
  end

  create_table "quote_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "product_id", null: false
    t.decimal "quantity", precision: 10, scale: 2
    t.bigint "quote_id", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_quote_items_on_product_id"
    t.index ["quote_id"], name: "index_quote_items_on_quote_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.date "approved_at"
    t.integer "available_duration_in_month"
    t.date "available_on"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.bigint "customer_id", null: false
    t.string "name"
    t.date "rejected_at"
    t.integer "status"
    t.datetime "updated_at", null: false
    t.string "uuid"
    t.index ["company_id"], name: "index_quotes_on_company_id"
    t.index ["customer_id"], name: "index_quotes_on_customer_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.bigint "company_id", null: false
    t.string "country_code"
    t.datetime "created_at", null: false
    t.string "name"
    t.string "prefix"
    t.string "province_code"
    t.integer "status"
    t.boolean "taxable"
    t.datetime "updated_at", null: false
    t.string "zip"
    t.index ["company_id"], name: "index_suppliers_on_company_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "tag_id", null: false
    t.bigint "taggable_id", null: false
    t.string "taggable_type", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id", "taggable_type", "taggable_id"], name: "index_taggings_on_tag_id_and_taggable_type_and_taggable_id", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable"
  end

  create_table "tags", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tags_on_company_id"
  end

  create_table "tax_return_expenses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "expense_id", null: false
    t.bigint "tax_return_id", null: false
    t.datetime "updated_at", null: false
    t.index ["expense_id"], name: "index_tax_return_expenses_on_expense_id"
    t.index ["tax_return_id"], name: "index_tax_return_expenses_on_tax_return_id"
  end

  create_table "tax_return_payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "payment_id", null: false
    t.bigint "tax_return_id", null: false
    t.datetime "updated_at", null: false
    t.index ["payment_id"], name: "index_tax_return_payments_on_payment_id"
    t.index ["tax_return_id"], name: "index_tax_return_payments_on_tax_return_id"
  end

  create_table "tax_returns", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.date "start_at"
    t.bigint "tax_yearly_id", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tax_returns_on_company_id"
    t.index ["tax_yearly_id"], name: "index_tax_returns_on_tax_yearly_id"
  end

  create_table "tax_yearlies", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.date "start_at"
    t.integer "tax_return_duration_in_month"
    t.decimal "tps_rate", precision: 10, scale: 8
    t.decimal "tvq_rate", precision: 10, scale: 8
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_tax_yearlies_on_company_id"
  end

  create_table "team_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "role"
    t.bigint "team_id", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["team_id"], name: "index_team_users_on_team_id"
    t.index ["user_id"], name: "index_team_users_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "categories", "companies"
  add_foreign_key "companies", "teams"
  add_foreign_key "customers", "companies"
  add_foreign_key "expenses", "companies"
  add_foreign_key "expenses", "suppliers"
  add_foreign_key "invoices", "quotes"
  add_foreign_key "payments", "invoices"
  add_foreign_key "products", "companies"
  add_foreign_key "quote_items", "products"
  add_foreign_key "quote_items", "quotes"
  add_foreign_key "quotes", "companies"
  add_foreign_key "quotes", "customers"
  add_foreign_key "sessions", "users"
  add_foreign_key "suppliers", "companies"
  add_foreign_key "taggings", "tags"
  add_foreign_key "tags", "companies"
  add_foreign_key "tax_return_expenses", "expenses"
  add_foreign_key "tax_return_expenses", "tax_returns"
  add_foreign_key "tax_return_payments", "payments"
  add_foreign_key "tax_return_payments", "tax_returns"
  add_foreign_key "tax_returns", "companies"
  add_foreign_key "tax_returns", "tax_yearlies"
  add_foreign_key "tax_yearlies", "companies"
  add_foreign_key "team_users", "teams"
  add_foreign_key "team_users", "users"
end
