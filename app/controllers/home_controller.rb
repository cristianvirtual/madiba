class HomeController < ApplicationController
  def index
<<<<<<< HEAD
  	@trips = Trip.where(user_id: 1) 
=======
    @trips = Trip.where(user_id: 1)
>>>>>>> add home view
  end
end
