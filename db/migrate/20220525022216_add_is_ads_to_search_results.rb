class AddIsAdsToSearchResults < ActiveRecord::Migration[7.0]
  def change
    add_column :search_results, :is_ads, :boolean
  end
end
