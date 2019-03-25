class SessionsController < ApplicationController

  def current_artist
    session[:artist_id] = params[:id]
  end
end
