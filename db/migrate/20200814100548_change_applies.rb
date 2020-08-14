class ChangeApplies < ActiveRecord::Migration[6.0]
  def change
    change_column :edition_applies, :organization, :text
  end
end
