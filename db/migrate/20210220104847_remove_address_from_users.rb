class RemoveAddressFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :address, :string
  end
end
