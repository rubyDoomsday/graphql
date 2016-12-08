class CreateMetrics < ActiveRecord::Migration[5.0]
  def change
    create_table :metrics do |t|
      t.jsonb :data
      t.references :summary, foreign_key: true

      t.timestamps
    end
  end
end
