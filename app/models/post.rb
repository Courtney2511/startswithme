class Post < ApplicationRecord
  belongs_to :user

  has_many :photos
  has_many :comments

  #mounting the iamge uploader to be used with the post model
  mount_uploader :image, ImageUploader
end
