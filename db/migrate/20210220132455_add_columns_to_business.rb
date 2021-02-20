class AddColumnsToBusiness < ActiveRecord::Migration[6.0]
  def change
    add_column :businesses, :qualification, :text
    add_column :businesses, :location, :string
    add_column :businesses, :language, :string
  end
end
