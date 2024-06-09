create_table 'categories', force: :cascade do |t|
  t.string :name, null: false

  t.timestamps null: false
end

add_index :categories, :name