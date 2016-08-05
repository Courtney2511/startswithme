class Post < ApplicationRecord
  belongs_to :user

  has_many :photos
  has_many :comments

  #mounting the iamge uploader to be used with the post model
  mount_uploader :image, ImageUploader

  validates :title, presence: true

  def posted_hours_ago(time)
    ((time - created_at)/1.hour).round
  end
end
