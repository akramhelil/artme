class ArtistsController < ApplicationController

  before_action :set_artist, only:[:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new

  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist.id)
    else
      render new_artist_path
    end
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def edit
    render :edit
  end

  def update
    @artist.update(artist_params)
    @artist.save
    redirect_to artist_path
  end

  def destroy
     @artist.destroy
     @artists = Artist.all
     render :index
  end

  private

  def artist_params
    params.require(:artist).permit(:first_name, :last_name, :email, :location, :bio)
  end

  def set_artist
    @artist = Artist.find(params[:id])
  end

end
