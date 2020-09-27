module VideosHelper
  MAX_FILENAME_LENGTH = 30

  def filename(video)
    video.video.filename.to_s.truncate(MAX_FILENAME_LENGTH)
  end
end
