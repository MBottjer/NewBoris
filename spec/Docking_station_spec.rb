require 'Docking_station'
require 'bike'

describe DockingStation do 

	let (:bike) {Bike.new}
	let (:station) {DockingStation.new}

	it 'can tell us when there are no bikes available' do 
		expect(station.bike_available?).not_to be_true
	end

	it 'can accept a bike' do
		expect(station.dock(bike)).to eq [bike]
	end

end 