class AddIndexToAccountsMobileNumber < ActiveRecord::Migration[6.0]
  def change
    add_index :accounts, :mobile_number, unique: true
  end
end
