class HomeController < ApplicationController
  def index
  	@trips = Trip.where(user_id: 1) 
  end
end
