create_table 'books_categories', force: :cascade do |t|
  t.bigint :book_id, null: false
  t.bigint :category_id, null: false

  t.timestamps null: false
end

add_index :books_categories, :book_id
add_index :books_categories, :category_id
add_index :books_categories, [:book_id, :category_id], unique: true
add_foreign_key :books_categories, :books
add_foreign_key :books_categories, :categories
