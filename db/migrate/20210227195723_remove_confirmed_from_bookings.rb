class RemoveConfirmedFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :confirmed, :boolean
  end
end
