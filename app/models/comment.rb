class Comment < ApplicationRecord
  belongs_to :user

  belongs_to :text
  belongs_to :photo
  belongs_to :video
end
