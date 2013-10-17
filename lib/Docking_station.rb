require_relative 'bike_container'

class DockingStation

	include BikeContainer

	attr_reader :capacity

	def initialize(bikes = [], capacity = 5)
		@bike_store = bikes 
		@capacity = capacity 
	end

	def release_to_customer
		bike = working_bikes.last
		@bike_store.delete(bike)
	end

end