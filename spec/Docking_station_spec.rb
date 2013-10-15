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

	it 'can release a bike' do 
		station.dock(bike)
		expect(station.rent).to eq bike 
	end

	it 'does not release bike if none available' do
		expect(station.rent).to eq nil
	end

	it 'does not rent bike if bike is broken' do
			bike.break!
			station.dock(bike)
			expect(station.rent).to eq nil
	end

end 