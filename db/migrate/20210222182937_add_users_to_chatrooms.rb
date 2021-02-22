class AddUsersToChatrooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :chatrooms, :customer, null: false, foreign_key: { to_table: :users }
    add_reference :chatrooms, :contractor, null: false, foreign_key: { to_table: :users }
  end
end
