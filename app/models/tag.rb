class Tag < ApplicationRecord
  has_many :video_tags
  has_many :videos, through: :video_tags
  # accepts_nested_attributes_for :video_tags
end
