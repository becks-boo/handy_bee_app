class CreateBusinessLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :business_languages do |t|
      t.references :language, null: false, foreign_key: true
      t.references :business, null: false, foreign_key: true

      t.timestamps
    end
  end
end
