class VideosController < ApplicationController
  def index
    @videos = Video.page(params[:page])
    @tags = Tag.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    if @video.save
      flash[:success] = 'The video was uploaded successfully.'
      redirect_to @video
    else
      message = []
      message << "Title #{@video.errors.messages[:title].first}" if @video.errors.messages[:title]
      message << @video.errors.messages[:invalid_video].first if @video.errors.messages[:invalid_video]
      flash[:alert] = message.join('. ')
      redirect_to new_video_path
    end
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
