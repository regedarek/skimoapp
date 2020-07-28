class AddNamesToReferees < ActiveRecord::Migration[6.0]
  def change
    add_column :referees, :first_name, :string
    add_column :referees, :last_name, :string
    add_column :referees, :organization, :string
  end
end
