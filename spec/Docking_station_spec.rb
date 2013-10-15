require 'Docking_station'
require 'bike'

describe DockingStation do 

	it 'can tell us when there are no bikes available' do 
		station = DockingStation.new 
		# station = []
		expect(station.bike_available?).not_to be_true
	end
end 