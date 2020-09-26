class TaggingsController < ApplicationController
  def create
    video = Video.find(params[:video_id])
    tag = Tag.find(params[:tag_id])
    VideoTag.create(video_id: video.id, tag_id: tag.id)

    redirect_to video
  end

  def destroy
    video = Video.find(params[:video_id])
    tag = Tag.find(params[:tag_id])
    VideoTag.where(video_id: video.id, tag_id: tag.id).first.destroy

    redirect_to video
  end
end
