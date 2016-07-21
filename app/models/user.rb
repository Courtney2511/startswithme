class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :posts

  # has_many :comments, through: :posts
  # has_many :photos, through: :posts


  has_secure_password

  validates :name, :email, :password, presence: true
end
