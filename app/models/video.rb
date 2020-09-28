class Video < ApplicationRecord
  has_one_attached :video
  has_many :video_tags, dependent: :delete_all
  has_many :tags, through: :video_tags

  validate :video_presense, on: :create

  def video_presense
    errors.add(:invalid_video, 'was selected') if !video.attached? || !video.content_type.in?(['video/mp4'])
  end
end
