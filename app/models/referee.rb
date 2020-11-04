class Referee < ApplicationRecord
  default_scope { order('expiration_date IS NULL, expiration_date DESC') }

  belongs_to :user, optional: true
  has_many :referee_unifications
  has_many :unifications, through: :referee_unifications

  validates :number, uniqueness: true, allow_nil: true
  delegate :email, :phone, :organizations, to: :user, allow_nil: true

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
      user.organizations.map(&:name).to_sentence
    else
      user_organizations
    end
  end

  def email
    if user.present?
      user.email
    else
      user_email
    end
  end

  def phone
    if user.present?
      user.phone
    else
      user_phone
    end
  end

  def to_entity
    RefereeEntity.new(
      id: id,
      first_name: first_name,
      last_name: last_name,
      email: email,
      phone: phone,
      organizations: organizations,
      expiration: expiration,
      number: number,
      user_id: user_id
    )
  end
end
