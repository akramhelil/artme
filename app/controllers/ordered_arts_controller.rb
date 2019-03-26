class OrderedArtsController < ApplicationController
    before_action :find_the_arts, only: [:index, :new]

  def index
  #show the items in the shopping cart when hit the
  end

  def new
    cart.each do |art|
      cart_arts = OrderedArt.new(art_id: art.to_i)
      cart_arts.save(:validate => false)
    end
  end


end
