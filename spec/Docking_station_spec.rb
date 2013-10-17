require 'Docking_station'
require 'bike'
require 'bike_container_spec'

describe DockingStation do 

	let (:bike) { double :bike, broken?: false }
	let (:station) {DockingStation.new}
	let (:broken_bike) { double :bike, broken?: true }


	it_behaves_like 'a bike container'

	it 'can release a bike to a customer' do 
		station.dock(bike)
		expect(station.release_to_customer).to eq bike 
	end

  it 'does not release bike to customer if none available' do
    expect(station.release_to_customer).to eq nil
  end

  it 'can accept a bike from customer' do
		expect(station.dock(bike)).to eq [bike]
	end

  it 'selects broken bikes' do
    station.dock broken_bike
    expect(station.broken_bikes).to eq [broken_bike]
  end

  it 'does not release bike to customer if bike is broken' do
    station.dock broken_bike
    expect(station.release_to_customer).to eq nil
  end

	

	it 'after releases bike, bike is no longer in store' do
		van = double :van
		station.dock broken_bike
		station.release_broken_bikes_to van
		expect(station.broken_bikes).to eq []
	end

	it 'releases multiple broken bikes to the van' do
		bike1 = broken_bike
		bike2 = double :bike, broken?: true
		van = double :van
		station.dock bike1
		station.dock bike2
		expect(station.release_broken_bikes_to van).to eq [bike1, bike2]
	end

	 it 'loses bikes when they are rented' do
	 	bike1 = double :bike, broken?: false
	 	bike2 = double :bike, broken?: false
	 	station.dock bike1
	 	station.dock bike2
	 	expect(station.bike_count).to eq 2
	 	station.release_to_customer
	 	expect(station.bike_count).to eq 1
	 end

	 it 'can hold a maximum of five bikes' do 
	 	5.times { station.dock(bike)}
	 	expect(station.bike_count).to eq 5
	 end

	 it 'cannot hold 6 bikes' do 
	 	6.times {station.dock(bike)} 
	 	expect(station.bike_count).to eq 5
	 end

	 it 'returns it\'s capacity' do
	 	expect(station.capacity).to eq 5
	 end

end 