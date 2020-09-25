class Video < ApplicationRecord
  has_one_attached :video
  has_many :video_tags
  has_many :tags, through: :video_tags
end
