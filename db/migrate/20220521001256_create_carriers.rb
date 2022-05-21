class CreateCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :carriers do |t|
      t.string :corporate_name
      t.string :brand_name
      t.string :domain
      t.string :registered_number
      t.string :full_address
      t.integer :status

      t.timestamps
    end
  end
end
