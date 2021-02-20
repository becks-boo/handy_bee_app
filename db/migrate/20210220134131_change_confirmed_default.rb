class ChangeConfirmedDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default :bookings, :confirmed, from: nil, to: false
  end
end
