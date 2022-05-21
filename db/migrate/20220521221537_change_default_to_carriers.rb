class ChangeDefaultToCarriers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :carriers, :status, from: 0, to: :active
  end
end
