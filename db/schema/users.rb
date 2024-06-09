create_table 'users', force: :cascade do |t|
  t.string :name, null: false
  t.string :name_kana, null: false

  ## Database authenticatable
  t.string :email, null: false, default: ''
  t.string :encrypted_password, null: false, default: ''

  ## Recoverable
  t.string   :reset_password_token
  t.datetime :reset_password_sent_at

  t.timestamps null: false
end

add_index :users, :reset_password_token, unique: true
