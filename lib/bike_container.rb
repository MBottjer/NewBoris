module BikeContainer

	# DEFAULT_CAPACITY = 10

	def bike_available?
		working_bikes.any?
	end

	def release_broken_bikes_to other
		bikes_to_load = broken_bikes
		@bike_store.delete_if{|bike| bike.broken?}
		other.load(bikes_to_load)
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

  def load bikes
  	@bike_store.concat bikes	
  end

end