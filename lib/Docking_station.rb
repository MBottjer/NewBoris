class DockingStation

	def initialize
		@bike_store = []
	end

	def bike_available?
		working_bikes.any?
	end

	def dock(bike)
		@bike_store<<bike 
	end

	def release
		working_bikes.pop
	end

	def release_to_van
		broken_bikes.map{ |bike| @bike_store.delete(bike) }
	end

	def working_bikes
		@bike_store.reject {|bicycle| bicycle.broken?} 
	end

	def broken_bikes
		@bike_store.select {|bicycle| bicycle.broken?}
	end

end