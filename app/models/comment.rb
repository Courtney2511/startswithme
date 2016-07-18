class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :texts
  belongs_to :photos
  belongs_to :videos
end
