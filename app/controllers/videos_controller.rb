class VideosController < ApplicationController
  def index
    @videos = Video.page(params[:page])
    @tags = Tag.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.create(video_params)
    redirect_to @video
  end

  def show
    @video = Video.includes(:tags).find(params[:id])
    @tags = @video.tags
    @all_tags = Tag.where.not(id: @tags.ids)
  end

  private

  def video_params
    params.require(:video).permit(:title, :video)
  end
end
