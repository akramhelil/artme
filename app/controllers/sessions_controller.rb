class SessionsController < ApplicationController


  #moved this to the Application Controller
  # def current_artist
  #   session[:artist_id] = params[:id]
  # end

  def login_attempt
    authorized_client = Client.authenticate(params[:email],params[:login_password])
    if authorized_client
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_client.first_name}"
      redirect_to welcome_path
    else
      flash[:notice] = "Invalid Username or Password"
      render logins_client_path
    end
  end
  
end
