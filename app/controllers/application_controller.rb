class ApplicationController < ActionController::Base

  def cart
    session[:cart] ||= []
  end

  def add_art_to_the_cart(art_id)
    cart << art_id
  end

  def find_the_arts
    @arts_in_the_cart = Art.find(cart)
  end
end
