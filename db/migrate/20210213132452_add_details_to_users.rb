class AddDetailsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :user_name, :string
    add_column :users, :address, :string
    add_column :users, :picture, :string
    add_column :users, :role, :string
    add_column :users, :qualifications, :text
  end
end
