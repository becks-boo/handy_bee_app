class AddUserIdToBusinesses < ActiveRecord::Migration[6.0]
  def change
    add_reference :businesses, :user, foreign_key: true
  end
end
