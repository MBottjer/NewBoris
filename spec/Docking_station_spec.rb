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
		expect(station.release).to eq bike 
	end

	it 'does not release bike if none available' do
		expect(station.release).to eq nil
	end

	it 'does not release bike if bike is broken' do
		bike.break!
		station.dock(bike)
		expect(station.release).to eq nil
	end

	it 'selects broken bikes' do
		bike.break!
		station.dock(bike)
		expect(station.broken_bikes).to eq [bike]
	end

	it 'releases broken bike to the van' do 
		bike.break!
		station.dock(bike)
		expect(station.release_to_van).to eq [bike]
	end

	it 'after releases bike, bike is no longer in store' do
		bike.break!
		station.dock(bike)
		station.release_to_van
		expect(station.broken_bikes).to eq []
	end

end 