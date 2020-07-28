class CreateRefereeUnifications < ActiveRecord::Migration[6.0]
  def change
    create_table :referee_unifications do |t|
      t.integer :referee_id
      t.integer :unification_id
    end
  end
end
