require 'bike_container'

class DockingStation

	include BikeContainer


	attr_reader :capacity

	def initialize(bikes = [], capacity = 5)
		@bike_store = bikes 
		@capacity = capacity 
	end

end