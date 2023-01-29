class VideosController < ApplicationController

  def home
    
  end

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def show
    @video = Video.find(params[:id])
  end

  def create
    @video = Video.new(video_params)
    @video.save
    redirect_to video_path(@video)
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to videos_path(@video), status: :see_others
  end

  private

  def video_params
    params.require(:video).permit(:title, :category, :published_year)
  end
end
