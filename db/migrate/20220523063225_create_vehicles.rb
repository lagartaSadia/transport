class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.string :brand
      t.string :vehicle_type
      t.integer :fabrication_date
      t.integer :capacity
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
