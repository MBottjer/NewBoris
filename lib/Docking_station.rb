class DockingStation

	def initialize
		@bike_store = []
	end

	def bike_available?
		@bike_store.any?
	end

	def dock(bike)
		@bike_store<<bike 
	end

	def rent
		working_bikes = @bike_store.reject {|bicycle| bicycle.broken?} 
		working_bikes.pop
	end

	def release_to_van
		broken_bikes = @bike_store.select {|bicycle| bicycle.broken?}
		broken_bikes
	end

end