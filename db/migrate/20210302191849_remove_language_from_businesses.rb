class RemoveLanguageFromBusinesses < ActiveRecord::Migration[6.0]
  def change
    remove_column :businesses, :language, :string
  end
end
