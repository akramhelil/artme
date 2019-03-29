class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update]
  before_action :authorized_client, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
      if @client.save
        redirect_to "/clients/#{@client.id}"
      else
        render :new
      end
  end

  def edit
  end

  def update
      if @client.update(client_params)
        redirect_to @client
      else
        render :edit
      end
    end

    def destroy
      set_client.destroy
           session.delete(:artist_id)
      flash[:notice] = "deleted"
      redirect_to 
    end

  private

  def client_params
    params.require(:client).permit(:first_name, :last_name, :password, :password_confirmation, :email, :address)
  end

  def set_client
    @client = Client.find_by(id: params[:id])
  end

end
