class AddResultsToEdiionApplies < ActiveRecord::Migration[6.0]
  def change
    add_column :edition_applies, :results, :string
    add_column :edition_applies, :fb_page, :string
  end
end
