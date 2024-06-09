create_table 'books_authors', force: :cascade do |t|
  t.bigint :book_id, null: false
  t.bigint :author_id, null: false

  t.timestamps null: false
end

add_index :books_authors, :book_id
add_index :books_authors, :author_id
add_index :books_authors, [:book_id, :author_id], unique: true
add_foreign_key :books_authors, :books
add_foreign_key :books_authors, :authors
