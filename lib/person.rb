class Person

  attr_reader :bike

	def initialize(bike=nil)
		@bike = bike 
	end

	def has_bike?
		!@bike.nil?
	end

	def rent_bike_from station
    return nil if has_bike?
		@bike = station.release
	end

  def return_bike_to station
    return nil if station.bike_count == station.capacity
   	station.dock(@bike) 
  	@bike = nil
  end

	def has_accident
    @bike.break!
	end

end