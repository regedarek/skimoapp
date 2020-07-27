class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :referee

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_one_attached :avatar
  after_commit :add_default_avatar, on: %i(create update)

  def display_name
    "#{first_name} #{last_name}"
  end

  def avatar_thumbnail
    avatar.variant(resize: "150x150!").processed if avatar.attached?
  end

  private

  def add_default_avatar
    unless avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.png')), filename: 'default-avatar.png', content_type: 'image/png')
    end
  end
end
