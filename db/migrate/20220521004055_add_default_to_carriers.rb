class AddDefaultToCarriers < ActiveRecord::Migration[7.0]
  def change
    change_column_default :carriers, :status, from: nil, to:0
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
