class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  #mounting the iamge uploader to be used with the comment model
  # mount_uploader :profile_picture, ProfilePictureUploader

  validates :comment, presence: true
end
