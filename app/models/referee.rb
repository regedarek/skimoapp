class Referee < ApplicationRecord
  belongs_to :user

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

  def organizations
    if user
      user.organizations.map(&:name)
    else
      [organization]
    end
  end
end
