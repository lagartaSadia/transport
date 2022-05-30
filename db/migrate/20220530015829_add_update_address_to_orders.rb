class AddUpdateAddressToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :update_address, :string
  end
end
