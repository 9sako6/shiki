class Video < ApplicationRecord
  has_one_attached :video
  has_many :video_tags, dependent: :delete_all
  has_many :tags, through: :video_tags

  MAX_TITLE_LENGTH = 120
  validates :title, presence: true, length: { maximum: MAX_TITLE_LENGTH }
  validate :video_presense, on: :create

  def video_presense
    errors.add(:invalid_video, 'It is an invalid video file.') if !video.attached? || !video.content_type.in?(['video/mp4'])
  end
end
