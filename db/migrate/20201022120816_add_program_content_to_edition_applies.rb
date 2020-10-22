class AddProgramContentToEditionApplies < ActiveRecord::Migration[6.0]
  def change
    add_column :edition_applies, :program_content, :text
  end
end
