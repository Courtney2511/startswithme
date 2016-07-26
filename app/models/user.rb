class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :posts

  # has_many :comments, through: :posts
  # has_many :photos, through: :posts

  #validates that the password is min 3 length, and stores the virtual password field in crypted_password
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }


  validates :name, :email, presence: true

  #mounting the iamge uploader to be used with the post model
  mount_uploader :profile_picture, ProfilePictureUploader
end
