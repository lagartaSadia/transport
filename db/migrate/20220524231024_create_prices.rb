class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.decimal :first_dimension
      t.decimal :second_dimension
      t.decimal :first_weight
      t.decimal :second_weight
      t.decimal :fee
      t.decimal :minimal_fee
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
