class EditionApply < ApplicationRecord
  has_one_attached :program_file
  has_rich_text :description

  validates :name, :description, :program_file, :start_date, presence: true
end
