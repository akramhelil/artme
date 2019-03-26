class LoginsController <ApplicationController
  #this will control flow the Artist and Client logins
  # skip_before_action :require_login, only: [:new, :create]
  def client_login
    
    #render the login for client with  authentication?
    #redirect to the arts_path  arts index page
    render :client_login
  end

  def artist_login
    #render the login page for the artist
    render :artist_login
  end
end
