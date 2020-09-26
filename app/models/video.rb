class Video < ApplicationRecord
  has_one_attached :video
  has_many :video_tags
  has_many :tags, through: :video_tags

  MAX_TITLE_LENGTH = 120
  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
end
