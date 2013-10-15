require 'person'

describe Person do 

	let (:bike) {double :bike}
	let (:station) {double :station}

	it 'initially has no bike' do
		person = Person.new 
		expect(person).not_to have_bike
	end

	it 'can have bike' do
		person = Person.new bike
		expect(person).to have_bike
	end

	it 'has a bike after renting a bike' do
		string = 'banana'
		station = double :station, {release: string}
		person = Person.new
		expect(station).to receive(:release)
		person.rent_bike_from station
		expect(person).to have_bike
	end

	it 'does note have bike after returning bike' do
		station = double :station, {dock: nil} 
		person = Person.new(bike)
		expect(station).to receive(:dock).with (:bike)
		person.return_bike_to station

		expect(person).not_to have_bike      
	end







end