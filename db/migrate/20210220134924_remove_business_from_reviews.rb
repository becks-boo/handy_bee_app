class RemoveBusinessFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reviews, :business
  end
end
