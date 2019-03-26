class CartsController < ApplicationController

  def update
    art = Art.find(params[:id])
    flash[:notice] = "The #{params[:title]} Added to Your Cart!"
    add_art_to_the_cart(params[:id])
    redirect_to art_path #After adding to the cart should stay on the art showpage?
  end

  def empty
    session[:cart] = nil
    redirect_to arts_path
  end

end
