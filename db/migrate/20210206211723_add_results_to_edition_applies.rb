class AddResultsToEditionApplies < ActiveRecord::Migration[6.0]
  def change
    add_column :edition_applies, :covid_19, :text
  end
end
