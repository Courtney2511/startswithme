class Photo < ApplicationRecord
  belongs_to :post

  # belongs_to :user
  
  #mounting the iamge uploader to be used with the photo model
  mount_uploader :image, ImageUploader
end
