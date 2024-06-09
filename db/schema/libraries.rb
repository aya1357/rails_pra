create_table 'libraries', force: :cascade do |t|
  t.string :name, null: false
  t.string :name_kana, null: false
  t.string :author, null: false
  t.string :author_kana, null: false
  t.string :category, null: false
  t.string :total_pages

  t.timestamps null: false
end

add_index :libraries, :name
add_index :libraries, :author
add_index :libraries, :category
