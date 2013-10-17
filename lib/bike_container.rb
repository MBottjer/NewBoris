module BikeContainer

	def bike_available?
		working_bikes.any?
	end

	def release_broken_bikes_to other
    bikes_to_load = broken_bikes
    bikes_to_load.each { |bike| dock_bike_into(other, bike) }
	end

  def release_working_bikes_to other
    bikes_to_load = working_bikes
    bikes_to_load.each { |bike| dock_bike_into(other, bike) }
  end

  def dock_bike_into other, bike
    unless other.full?
      other.dock bike
      bike_store.delete bike
    end
  end

  def dock(bike)
    @bike_store << bike unless full?
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

  def bike_store
    @bike_store
  end

  def full?
    bike_count == capacity
  end

  def load bikes
    bikes.each { |bike| @bike_store << bike unless full? }
  end

end