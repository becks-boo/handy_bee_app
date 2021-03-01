class AddColumnToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :confirmed, :boolean, default: nil
  end
end
