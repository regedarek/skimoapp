class CreateEditionApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :edition_applies do |t|
      t.string :name
      t.string :organization
      t.integer :season_id
      t.text :description
      t.datetime :start_date
      t.string :address
      t.string :program
      t.string :map_default
      t.integer :volounteers
      t.text :categories
      t.text :technical_restrictions
      t.text :accomodation
      t.text :contact
      t.timestamps
    end
  end
end
