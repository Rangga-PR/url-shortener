class HomeController < ApplicationController
  def index
    if !session[:shortenUrl]
      session[:shortenUrl] = []
    end
    
    @shortenUrl = session[:shortenUrl]
  end
end
