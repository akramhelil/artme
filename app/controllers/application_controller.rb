class ApplicationController < ActionController::Base
  # before_action :require_login


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

  def add_art_to_the_cart(art_id)
    cart << art_id
  end

  def find_the_art
    @arts_in_the_cart = Art.find(cart)
  end

  # def require_login
  #   unless logged_in?
  #     flash[:error] = "You must be logged in to access this section"
  #     redirect_to new_login_url # halts request cycle
  #   end
  # end

end
