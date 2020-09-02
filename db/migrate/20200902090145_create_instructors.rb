class CreateInstructors < ActiveRecord::Migration[6.0]
  def change
    create_table :instructors do |t|
      t.integer :user_id
      t.integer :number, null: true
      t.date :expiration_date
      t.string :first_name
      t.string :last_name
      t.string :organization
      t.timestamps
    end

    add_index(:instructors, [:user_id, :number], unique: true)
    add_index(:instructors, :number, unique: true)
  end
end
