class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.belongs_to :user, index: true, null:false
      t.string :slug, null:false
      t.string :url, null:false
      t.string :name
      t.datetime :expires_at
      t.string :password_digest
      t.integer :remaining_accesses
      t.string :link_type, null: false

      t.timestamps
    end
    add_index :links, :slug, unique: true
  end
end
