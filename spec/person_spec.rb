require 'person'

describe Person do 

	let (:bike) {double :bike}
	let (:station) {double :station}
	let (:person) { Person.new bike}
	let (:person2) { Person.new }

	it 'initially has no bike' do
		expect(person2).not_to have_bike
	end

	it 'can have bike' do
		expect(person).to have_bike
	end

	it 'can get a bike from the station' do
		expect(station).to receive(:release)
    person2.rent_bike_from station
	end

	it 'has a bike after renting a bike' do
		station = double :station, {release: :bike}
		expect(station).to receive(:release)
		person2.rent_bike_from station
		expect(person2).to have_bike
	end

	it 'can dock a bike in a station' do
		station = double :station, {dock: :banana} 
		expect(station).to receive(:dock).with (bike)
		person.return_bike_to station
	end


	it 'does not have bike after returning bike' do
		station = double :station, {dock: :banana} 
		person.return_bike_to station

		expect(person).not_to have_bike      
	end

	it 'can break a bike' do
		expect(bike).to receive(:break!)
		person.has_accident
	end

end