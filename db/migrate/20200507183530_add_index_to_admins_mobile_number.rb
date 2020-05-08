class AddIndexToAdminsMobileNumber < ActiveRecord::Migration[6.0]
  def change
    add_index :admins, :mobile_number, unique: true
  end
end
