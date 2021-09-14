class User < ApplicationRecord
  attr_accessor :skip_validations
  validates :name, length: { maximum: 30}
    validates :email, presence: true, length: { maximum: 255},
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: true
    before_validation {email.downcase!}
    has_secure_password
    validates :password, presence: true, length: {minimum: 6}, unless: :skip_validations
    has_many :posts
    has_many :favorites, dependent: :destroy
    has_many :favorite_posts, through: :favorites, source: :post
    mount_uploader :profile_picture, ProfilePictureUploader
end
