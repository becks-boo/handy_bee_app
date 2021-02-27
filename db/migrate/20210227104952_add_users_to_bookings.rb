class AddUsersToBookings < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookings, :customer, null: false, foreign_key: { to_table: :users }
    add_reference :bookings, :contractor, null: false, foreign_key: { to_table: :users }
  end
end
