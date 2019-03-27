class SessionsController < ApplicationController
  # skip_before_action :authorized, only: [:new, :client_login]

  def new

  end

  def artist_new
    render :artist_login
  end

  def client_login
    @client = Client.find_by(email: params[:email])
    if !@client.nil? && @client.authenticate(params[:password]) && @client
      session[:client_id] = @client.id
      redirect_to root_path
      flash[:notice] = "Wow Welcome again, you logged in as #{@client.first_name}"
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to login_path
    end
  end


    def artist_login
      @artist = Artist.find_by(email: params[:email])
      if !@artist.nil? && @artist.authenticate(params[:password])
        session[:artist_id] = @artist.id
        redirect_to root_path
        flash[:notice] = "Wow Welcome again, you logged in as #{@artist.first_name}"
      else
        flash[:notice] = "Invalid Username or Password"
        redirect_to login_artist_path
      end

    end

    def client_logout
      session.delete(:client_id)
      flash[:notice] = "Now You are Safely Logged Out, Please Come Again!"
      redirect_to login_path
    end


end
