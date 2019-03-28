class WelcomeController < ApplicationController
  def index
    @artists = Artist.all
    @arts = Art.all

  end

  def about
  end

end
