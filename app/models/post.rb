class Post < ApplicationRecord
  belongs_to :user

  has_many :photos
  has_many :comments

  #mounting the iamge uploader to be used with the post model
  mount_uploader :image, ImageUploader

  validate :title_or_link_or_image

  private

  def title_or_link_or_image
    if [self.title, self.link, self.image].reject(&:blank?).size == 0
      errors[:base] << ("Please enter at least one field")
    end
  end
end
