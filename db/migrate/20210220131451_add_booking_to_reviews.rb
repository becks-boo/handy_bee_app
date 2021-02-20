class AddBookingToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :booking, foreign_key: true
  end
end
