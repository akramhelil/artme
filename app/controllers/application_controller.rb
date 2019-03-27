class ApplicationController < ActionController::Base
  helper_method :cart



  def current_client#added in the current client
    return unless session[:client_id]
    @current_client ||= Client.find(session[:client_id])
  end

 def current_artist
   return unless session[:artist_id]
   @current_artist ||= Artist.find(session[:client_id])
 end


  def cart
    session[:cart] ||= []
  end

  def add_art_to_the_cart(art)
    cart << art
  end

  def find_the_arts
    # byebug
    @arts_in_the_cart = cart
  end

  def client_logged_in?
    !!current_client
  end

  def authorized
    if !client_logged_in?
        redirect_to login_path
    end
  end



end
