class Tag < ApplicationRecord
  has_many :video_tags
  has_many :videos, through: :video_tags

  MAX_NAME_LENGTH = 120
  validates :name, presence: true, length: { maximum: MAX_NAME_LENGTH }
end
