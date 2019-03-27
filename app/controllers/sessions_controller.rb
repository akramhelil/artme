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
      current_client
      redirect_to root_path
      flash[:notice] = "Wow Welcome again, you logged in as #{@client.first_name}"
    else
      flash[:notice] = "Invalid Username or Password"
      redirect_to login_path
    end

  end


  def artist_login
    @artist = Artist.find_by(email: params[:email])
    if !@artist.nil? && @artist.authenticate(params[:password]) && @artist
      session[:artist_id] = @artist.id
      current_artist
      redirect_to new_art_path
      flash[:notice] = "Wow Welcome again, you logged in as #{@artist.first_name}"
    else
      flash[:notice] = "Artist Invalid Username or Password"
      redirect_to "/login/artist"
    end
  end

  def client_logout
    session.delete(:client_id)
    flash[:notice] = "Now You are Safely Logged Out, Please Come Again!"
    redirect_to login_path
  end

  def artist_logout
    session.delete(:artist_id)
    flash[:notice] = "Artist page Safely Logged Out!"
    redirect_to "/login/artist"
  end

end
