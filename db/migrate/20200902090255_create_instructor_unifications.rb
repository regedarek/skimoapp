class CreateInstructorUnifications < ActiveRecord::Migration[6.0]
  def change
    create_table :instructor_unifications do |t|
      t.integer :instructor_id
      t.integer :unification_id
      t.timestamps
    end
  end
end
