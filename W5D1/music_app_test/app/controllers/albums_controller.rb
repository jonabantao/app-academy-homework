class AlbumsController < ApplicationController
  before_action :must_log_in

  def new
    @album = Album.new
    @bands = Band.all

    render :new
  end

  def create
    @album = Album.new(album_params)

    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find_by(id: params[:id])
    render :show
  end

  def edit
    @album = Album.find_by(id: params[:id])
    @bands = Band.all

    render :edit
  end

  def update
    @album = Album.find_by(id: params[:id])

    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:errors] = @albums.error_full_messages

    end
  end

  def destroy
    @album = Album.find_by(id: params[:id])
    @band = Band.find_by(id: @album.band_id)

    @album.destroy
    redirect_to band_url(@band)
  end

  private

  def album_params
    params.require(:album).permit(:title, :year, :band_id, :is_live_album)
  end
end
