class CreateAthletes < ActiveRecord::Migration[6.0]
  def change
    create_table :athletes do |t|
      t.integer :user_id, null: false
      t.integer :number, null: false
      t.timestamps
    end

    add_index(:athletes, :user_id, unique: true)
    add_index(:athletes, :number, unique: true)
    add_index(:athletes, [:user_id, :number], unique: true)
    add_index(:referees, :user_id, unique: true)
    add_index(:referees, :number, unique: true)
    add_index(:referees, [:user_id, :number], unique: true)
  end
end
