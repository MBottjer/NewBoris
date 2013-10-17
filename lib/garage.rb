require_relative 'bike_container'

class Garage 

  include BikeContainer

  def initialize(bikes = [], capacity = 5)
    @bike_store = bikes
    @capacity = capacity
  end

  def fix
    broken_bikes.each { |bike| bike.fix }
  end

end