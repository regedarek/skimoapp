class Referee < ApplicationRecord
  belongs_to :user

  def active?
    Time.zone.now < expiration_date.to_date
  end
end
