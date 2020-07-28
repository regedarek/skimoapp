class CreateUnifications < ActiveRecord::Migration[6.0]
  def change
    create_table :unifications do |t|
      t.string :name
      t.text :description
      t.date :exact_date
    end
  end
end
