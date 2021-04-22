class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  has_secure_password
  mount_uploader :avatar, AvatarUploader

  has_many :questions
end
