class Instructor < ApplicationRecord
  default_scope { order('expiration_date IS NULL, expiration_date DESC') }

  belongs_to :user, optional: true
  has_many :instructor_unifications
  has_many :unifications, through: :instructor_unifications

  validates :number, uniqueness: true, allow_nil: true

  def active?
    Time.zone.now < expiration_date.to_date
  end

  def display_name
    if user
      user.display_name
    else
      "#{first_name} #{last_name}"
    end
  end

  def expiration
    if unifications.any?
      unifications.order(:exact_date).last.exact_date
    else
      expiration_date
    end
  end

  def organizations
    if user
      user.organizations.map(&:name)
    else
      [organization]
    end
  end
end
