module BikeContainer

	# DEFAULT_CAPACITY = 10

	def bike_available?
		working_bikes.any?
	end

	def dock(bike)
		@bike_store<<bike unless full?
	end

	def release
		bike = working_bikes.last
		@bike_store.delete(bike)
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

	def bike_count
		@bike_store.count
	end

  def capacity
    @capacity
  end

  def full?
    bike_count == capacity
  end

end