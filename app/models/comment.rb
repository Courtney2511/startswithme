class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user

  #mounting the iamge uploader to be used with the comment model
  mount_uploader :profile_picture, ProfilePictureUploader

  def hours
    ((Time.now - created_at)/1.hour).round
  end

  def convert_hours
    if hours == 0
      'less than 1'
    elsif hours < 1
      (hours * 60).round
    elsif hours > 24
      (hours / 24).round
    else
      hours
    end
  end

  def min_hour_day
    if hours == 0
      return 'minute'
    elsif hours < 1
      return 'minutes'
    elsif hours > 24
      return 'day'
    else
      return 'hour'
    end
  end

end
