module BikeContainer

	def bike_available?
		working_bikes.any?
	end

	def release_broken_bikes_to other
    bikes_to_load = broken_bikes
		@bike_store.delete_if { |bike| bike.broken? }
    other.load(bikes_to_load)
	end

  def release_working_bikes_to other
    bikes_to_load = working_bikes
    @bike_store.delete_if { |bike| bike.broken? == false }
    other.load(bikes_to_load)
  end

	def working_bikes
		@bike_store.reject { |bicycle| bicycle.broken? } 
	end

	def broken_bikes
		@bike_store.select { |bicycle| bicycle.broken? }
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
    bikes.each { |bike| @bike_store << bike unless full? }
  end

end