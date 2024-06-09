create_table 'reading_plans', force: :cascade do |t|
  t.date :start_day, null: false
  t.string :day_of_week, null: false
  t.integer :total_pages, null: false
  t.integer :start_page, null: false
  t.integer :end_page, null: false
  t.integer :target_pages, null: false
  t.bigint :book_id, null: false

  t.timestamps null: false
end

add_foreign_key :reading_plans, :books