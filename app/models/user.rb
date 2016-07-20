class User < ApplicationRecord
  has_many :comments
  has_many :texts
  has_many :photos
  has_many :videos

  has_secure_password

  validates :name, :email, :password, presence: true
end
