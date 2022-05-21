class RemoveStatusToCarriers < ActiveRecord::Migration[7.0]
  def change
    remove_column :carriers, :status
  end
end
