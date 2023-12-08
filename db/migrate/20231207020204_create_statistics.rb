class CreateStatistics < ActiveRecord::Migration[7.1]
  def change
    create_table :statistics do |t|
      t.belongs_to :link, index: true, null:false
      t.datetime :date
      t.string :ip_address

      t.timestamps
    end
  end
end
