class Post < ApplicationRecord
  belongs_to :user

  has_many :photos
  has_many :comments

  #mounting the iamge uploader to be used with the post model
  mount_uploader :image, ImageUploader

  validates :title, presence: true

  def time_passed(time)
    hours_passed = ((time - created_at)/1.hour)
    if hours_passed < 1
      return "#{(hours_passed * 60).round} minutes ago"
    elsif hours_passed > 24
      return "#{(hours_passed / 24).round} days ago"
    else
      return "#{hours_passed.round} hours ago"
    end
  end
end
