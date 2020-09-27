class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(tag_params)
    @tag.save
    redirect_back(fallback_location: root_path)
  end

  def show
    @tag = Tag.includes(:videos).find(params[:id])
    @videos = @tag.videos
    @tags = Tag.all
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
