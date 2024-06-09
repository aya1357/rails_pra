create_table 'books', force: :cascade do |t|
  t.string :title, null: false
  t.string :url
  t.bigint :user_id, null: false
  t.boolean :status, default: false, null: false

  t.timestamps null: false
end

add_foreign_key :books, :users
add_index :books, :user_id
add_index :books, :title
