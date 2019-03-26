class OrdersController < ApplicationController

  def new
    session[:cart] = nil
    Order.create()
  end
end
