create_table 'authors', force: :cascade do |t|
  t.string :name, null: false
  t.string :name_kana, null: false

  t.timestamps null: false
end

add_index :authors, :name
