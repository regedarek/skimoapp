class AddEmailToReferees < ActiveRecord::Migration[6.0]
  def change
    add_column :referees, :email, :string
    add_column :referees, :phone, :string
    add_column :referees, :organizations, :string
  end
end
