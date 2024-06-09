create_table 'reading_histories', force: :cascade do |t|
  t.bigint :user_id, null: false
  t.bigint :book_id, null: false
  t.date :date, null: false
  t.integer :read_pages, null: false

  t.timestamps null: false
end

add_index :reading_histories, :user_id
add_index :reading_histories, :book_id
add_foreign_key :reading_histories, :users
add_foreign_key :reading_histories, :books
