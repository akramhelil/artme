class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update]
  before_action :find_the_arts, only: :show
  # before_action :authorized_artist, only: [:edit, :new, :update, :destroy]


    def index
      @arts = Art.all
    end

    def new
      @art = Art.new
    end

    def create
      @art = Art.create(art_params)
      @artists = Artist.all
      # @art.artist_id = current_artist.id
        if @art
          redirect_to "/arts/#{@art.id}"
        else
          render :new
        end
    end

    def show
    end

    def edit

    end

    def update
        if @art.update(art_params)
          redirect_to @art
        else
          render :edit
        end
      end


    def destroy
      set_art.destroy
      flash[:notice] = "deleted"
      redirect_to "/arts"
    end

    private

    def art_params
      params.require(:art).permit(:title, :artist_id, :descrption, :price, :est_date, :img_url, :time_required)
    end

    def set_art
      @art = Art.find_by(id: params[:id])
    end
end
