class CartsController < ApplicationController

  def update
    art = Art.find(params[:id])
    flash[:notice] = "The #{params[:title]} Added to Your Cart!"
    add_art_to_the_cart(params[:id])
    redirect_to arts_path
  end

  def empty
    session[:cart] = nil
    redirect_to arts_path
  end

end
