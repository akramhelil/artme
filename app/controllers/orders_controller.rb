class OrdersController < ApplicationController
  def index
    @orders = Client.orders
    #is this should be current_client.orders since we only need to
    #see the clients order histroy?

  end



end
