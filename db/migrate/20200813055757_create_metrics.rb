class CreateMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :metrics do |t|
      t.string :key
      t.integer :value
      
      t.timestamps
    end
  end
end
