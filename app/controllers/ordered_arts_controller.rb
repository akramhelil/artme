class OrderedArtsController < ApplicationController
before_action :find_the_arts, only: [:index, :new]


  def new
    cart.each do |art|
      cart_arts = OrderedArt.new(art_id: art.to_i)
      cart_arts.save(:validate => false)
    end
    render :new
  end

  def index
  #show the items in the shopping cart when hit the
  end

  
  # def index
  #   byebug
  #   @orders = Client.orders
  #   #is this should be current_client.orders since we only need to
  #   #see the clients order histroy?
  # end
  #
  # def new
  #   byebug
  #   # client_id = session[:client_id]
  #   # client_order = Order.create(client_id: client_id, complete: true)
  #   # OrderedArt.find_by()
  #
  #   #find the OrderedArt via ID and then uodate
    # session[:cart] = nil
  #   @client_orders =
  #   redirect_to
  # end





end
