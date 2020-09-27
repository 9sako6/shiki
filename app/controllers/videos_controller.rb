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
      flash[:success] = 'The video was uploaded.'
      redirect_to @video
    else
      render 'new'
    end
  end

  def show
    @video = Video.includes(:tags).find(params[:id])
    @tags = @video.tags
    @all_tags = Tag.where.not(id: @tags.ids)
  end

  def destroy
    video = Video.find(params[:id])
    video.video.purge
    if video.destroy
      flash[:success] = 'The video was deleted.'
      redirect_to root_path
    else
      flash[:alert] = 'fail to delete the video.'
      redirect_to video_path(video)
    end
  end

  private

  def video_params
    params.require(:video).permit(:title, :video)
  end
end
