class CreateDeliveryTimes < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_times do |t|
      t.integer :first_distance
      t.integer :second_distance
      t.integer :time
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
