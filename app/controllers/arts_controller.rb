class ArtsController < ApplicationController
  before_action :set_art, only: [:show, :edit, :update]

    def show
    end

    def index
      @arts = Art.all
    end

    def new
      @art = Art.new
    end

    def create
      @art = Art.new(art_params)
        if @art.save
          redirect_to "/arts/#{@art.id}"
        else
          render :new
        end
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
      params.require(:art).permit(:title, :descrption, :price, :est_date, :img_url)
    end

    def set_art
      @art = Art.find_by(id: params[:id])
    end






end
