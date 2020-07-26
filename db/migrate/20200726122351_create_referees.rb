class CreateReferees < ActiveRecord::Migration[6.0]
  def change
    create_table :referees do |t|
      t.integer :user_id
      t.integer :number
      t.date :expiration_date
      t.timestamps
    end
  end
end
