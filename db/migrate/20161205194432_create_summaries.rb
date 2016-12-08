class CreateSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :summaries do |t|
      t.date :date
      t.string :category
      t.string :customer_id
      t.string :user_id
      t.string :uid
      t.string :origin
      t.string :source
      t.string :device_type
      t.string :device_name

      t.timestamps
    end
  end
end
