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

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_authors_on_name"
  end

  create_table "books", force: :cascade do |t|
    t.string "title", null: false
    t.string "url"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: false, null: false
    t.index ["title"], name: "index_books_on_title"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "books_authors", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "author_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_books_authors_on_author_id"
    t.index ["book_id", "author_id"], name: "index_books_authors_on_book_id_and_author_id", unique: true
    t.index ["book_id"], name: "index_books_authors_on_book_id"
  end

  create_table "books_categories", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id", "category_id"], name: "index_books_categories_on_book_id_and_category_id", unique: true
    t.index ["book_id"], name: "index_books_categories_on_book_id"
    t.index ["category_id"], name: "index_books_categories_on_category_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name", null: false
    t.string "name_kana", null: false
    t.string "author_kana", null: false
    t.string "category", null: false
    t.string "total_pages"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "author", null: false
    t.index ["author"], name: "index_libraries_on_author"
    t.index ["category"], name: "index_libraries_on_category"
    t.index ["name"], name: "index_libraries_on_name"
  end

  create_table "reading_histories", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.date "date", null: false
    t.integer "read_pages", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reading_histories_on_book_id"
    t.index ["user_id"], name: "index_reading_histories_on_user_id"
  end

  create_table "reading_plans", force: :cascade do |t|
    t.date "start_day", null: false
    t.string "day_of_week", null: false
    t.integer "total_pages", null: false
    t.integer "start_page", null: false
    t.integer "end_page", null: false
    t.integer "target_pages", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", null: false
    t.string "name_kana", null: false
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "books", "users"
  add_foreign_key "books_authors", "authors"
  add_foreign_key "books_authors", "books"
  add_foreign_key "books_categories", "books"
  add_foreign_key "books_categories", "categories"
  add_foreign_key "reading_histories", "books"
  add_foreign_key "reading_histories", "users"
  add_foreign_key "reading_plans", "books"
end
