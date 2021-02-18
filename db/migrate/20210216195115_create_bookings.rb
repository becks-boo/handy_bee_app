class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.float :price
      t.date :start_date
      t.date :end_date
      t.boolean :confirmed
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
