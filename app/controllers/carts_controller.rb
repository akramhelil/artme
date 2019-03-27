class CartsController < ApplicationController

  def update
    art = Art.find_by(id: params[:id])
# byebug
    flash[:notice] = "#{params[:title]} is in your cart!"
    add_art_to_the_cart(params[:id])

    redirect_to request.referrer
  end

  def empty
    session[:cart] = nil
    # redirect_to arts_path
    redirect_to request.referrer
  end

  def check_out
    session[:cart] = nil
    render :check_out
  end

end
