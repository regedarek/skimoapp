class AddSignUpUrlToEditionApplies < ActiveRecord::Migration[6.0]
  def change
    add_column :edition_applies, :sign_up_url, :string
  end
end
