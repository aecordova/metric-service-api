class CreateMetrics < ActiveRecord::Migration[6.0]
  def change
    create_table :metrics do |t|

      t.timestamps
    end
  end
end
