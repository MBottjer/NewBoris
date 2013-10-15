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
		@bike_store.pop
	end


end