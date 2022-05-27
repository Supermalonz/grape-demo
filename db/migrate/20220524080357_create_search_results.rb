class CreateSearchResults < ActiveRecord::Migration[7.0]
  def change
    create_table :search_results do |t|
      t.string :header
      t.string :url
      t.references :keyword, null: false, foreign_key: true

      t.timestamps
    end
  end
end
