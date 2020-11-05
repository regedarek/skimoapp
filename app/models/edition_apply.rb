class EditionApply < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :season

  delegate :year, to: :season

  has_one_attached :program_file
  has_one_attached :map_1
  has_one_attached :map_2
  has_one_attached :map_3

  has_rich_text :description
  has_rich_text :program_content
  has_rich_text :categories
  has_rich_text :technical_restrictions
  has_rich_text :contact
  has_rich_text :accomodation
  has_rich_text :organization

  validates :name, :organization, :address, :volounteers, :map_1, :map_2, :categories, :technical_restrictions, :accomodation, :contact, :description, :program_content, :start_date, presence: true
  validates :terms, acceptance: true

  def start_date_to_date
    start_date.to_date
  end

  def slug_candidates
    [
      [:start_date_to_date, :name]
    ]
  end
end
