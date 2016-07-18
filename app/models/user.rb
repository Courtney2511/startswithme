class User < ApplicationRecord
  has_many :comments
  has_many :texts
  has_many :photos
  has_many :videos
end
