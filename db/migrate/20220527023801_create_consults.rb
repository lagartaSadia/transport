class CreateConsults < ActiveRecord::Migration[7.0]
  def change
    create_table :consults do |t|
      t.decimal :item_dimension
      t.decimal :item_weight
      t.integer :distance

      t.timestamps
    end
  end
end
