require 'person'

describe Person do 

	let (:bike) {double :bike}
	let (:station) {double :station}
	let (:jeff) { Person.new bike}
	let (:devesh) { Person.new }

	it 'initially has no bike' do
		expect(devesh).not_to have_bike
	end

	it 'can have bike' do
		expect(jeff).to have_bike
	end

	it 'can get a bike from the station' do
		expect(station).to receive(:release_to_customer)
    devesh.rent_bike_from station
	end

	it 'has a bike after renting a bike' do
		station = double :station, {release_to_customer: :bike}
		expect(station).to receive(:release_to_customer)
		devesh.rent_bike_from station
		expect(devesh).to have_bike
	end

	it 'can dock a bike in a station' do
		station = double :station, {full?: false, dock: :banana} 
		expect(station).to receive(:dock).with (bike)
		jeff.return_bike_to station
	end


	it 'does not have bike after returning bike' do
		station = double :station, {full?: false, dock: :banana} 
		jeff.return_bike_to station

		expect(jeff).not_to have_bike      
	end

	it 'can break a bike' do
		expect(bike).to receive(:break!)
		jeff.has_accident
	end

  it 'has the bike he believes he has' do
    expect(jeff.bike).to be bike
  end

	it 'can\'t rent another bike if it has a rented bike' do 
		jeff.rent_bike_from station
		expect(jeff.bike).to be bike
	end

	it 'keeps bike if attempts to return it to full docking station' do
		station = double :station, { full?: true }
		jeff.return_bike_to station
		expect(jeff.has_bike?).to  be_true
	end

end
