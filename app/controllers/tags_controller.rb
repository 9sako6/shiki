class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.create(tag_params)
    redirect_to @tag
  end

  def show
    @tag = Tag.includes(:videos).find(params[:id])
    @videos = @tag.videos
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end
end
