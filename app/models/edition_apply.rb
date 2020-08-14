class EditionApply < ApplicationRecord
  has_one_attached :program_file
  has_one_attached :map_1
  has_one_attached :map_2
  has_one_attached :map_3
  has_rich_text :description
  has_rich_text :categories
  has_rich_text :technical_restrictions
  has_rich_text :contact
  has_rich_text :accomodation
  has_rich_text :organization

  validates :name, :organization, :address, :volounteers, :map_1, :map_2, :map_3, :categories, :technical_restrictions, :accomodation, :contact, :description, :program_file, :start_date, presence: true
end
