class AddDescriptionToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :description, :text
  end
end
