class AddNamesToReferees < ActiveRecord::Migration[6.0]
  def change
    add_column :referees, :first_name, :string
    add_column :referees, :last_name, :string
    add_column :referees, :organization, :string
    change_column_null :referees, :user_id, true
    change_column_null :referees, :number, true
    add_index(:referees, [:user_id, :number], unique: true)
    add_index(:referees, :number, unique: true)
  end
end
