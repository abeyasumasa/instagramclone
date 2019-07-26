class User < ApplicationRecord
  mount_uploader :user_image, UserImageUploader
  validates :name,  presence: true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 6 }
  validates :email, presence: true, length: { maximum: 255 },
                      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  has_many :photos
  has_many :favorites, dependent: :destroy
  has_many :favorite_photos, through: :favorites, source: :photo
end
