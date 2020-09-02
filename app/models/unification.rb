class Unification < ApplicationRecord
  has_many :referee_unifications
  has_many :referees, through: :referee_unifications
  has_many :instructor_unifications
  has_many :instructors, through: :instructor_unifications

  has_rich_text :description
end
