class AlbumsController < ApplicationController

  def index
    @albums = Album.ranking(15)
  end

  def show
    @album = Album.find(params[:id])
  end

  def upvote
    album = Album.find(params[:id])
    album.add_vote
    album.save

    redirect_to album_path
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.create(create_params[:album])
    @album.rank = 0
    @album.save

    redirect_to album_path(@album)
  end

  def edit
    show
  end

  def update
    edit
    @album.update(create_params[:album])

    redirect_to album_path(@album)
  end

  def destroy
    edit
    @album.destroy

    redirect_to albums_path
  end

  private

  def create_params
    params.permit(album: [:name, :artist, :description, :rank])
  end

end
