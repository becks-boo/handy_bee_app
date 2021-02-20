class RemoveQualificationsFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :qualifications, :text
  end
end
