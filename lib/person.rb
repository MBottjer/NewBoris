class Person

  attr_reader :bike

	def initialize(bike=nil)
		@bike = bike 
	end

	def has_bike?
		!@bike.nil?
	end

	def rent_bike_from station
		@bike = station.release_to_customer unless has_bike?
	end

  def return_bike_to station
		(station.dock(@bike); @bike = nil) unless station.full?
		#@bike = nil unless station.full?
	end

	def has_accident
    @bike.break!
	end

end