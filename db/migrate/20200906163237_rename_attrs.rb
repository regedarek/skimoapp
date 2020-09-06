class RenameAttrs < ActiveRecord::Migration[6.0]
  def change
    rename_column :referees, :email, :user_email
    rename_column :referees, :phone, :user_phone
    remove_column :referees, :organizations
    rename_column :referees, :organization, :user_organizations
  end
end
