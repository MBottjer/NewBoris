require_relative 'bike_container'

class Van
	include BikeContainer

	def initialize(bikes = [], capacity = 5)
		@bike_store = bikes 
		@capacity = capacity 
	end

  def pickup_bikes_from container
    container.release_working_bikes_to self
  end

end