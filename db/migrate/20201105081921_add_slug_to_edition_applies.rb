class AddSlugToEditionApplies < ActiveRecord::Migration[6.0]
  def change
    add_column :edition_applies, :slug, :string
    add_index :edition_applies, :slug, unique: true
  end
end
