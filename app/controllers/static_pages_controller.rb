class StaticPagesController < ApplicationController
  def index
  end

  def search
    flickr = Flickr.new(ENV["flickr_api_key"], ENV["flickr_api_secret"])
    images = flickr.photos.search(user_id: params[:user_id])
    @urls = images.map {|i| Flickr.url(flickr.photos.getInfo(photo_id: i.id))}
    render :index
  end

  private
  def search_params
    params.permit(:user_id)
  end
end
