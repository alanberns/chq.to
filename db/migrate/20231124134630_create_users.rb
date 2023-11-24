class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users, force: :cascade do |t|
      t.string :username, null: false, limit: 25
      t.string :password_digest
      t.string :email, null: false

      t.timestamps
    end
    add_index :users, :username, unique: true
    add_index :users, :email, unique: true
  end
end
