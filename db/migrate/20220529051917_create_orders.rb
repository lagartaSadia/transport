class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :vendor_address
      t.string :item_code
      t.decimal :item_dimension
      t.decimal :item_weight
      t.string :client_address
      t.string :client_information
      t.references :carrier, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.integer :status
      t.date :update_date

      t.timestamps
    end
  end
end
