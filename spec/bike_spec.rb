require 'bike'

describe Bike do

	it 'is not broken when initially rented' do 
		bike = Bike.new
		expect(bike).not_to be_broken
	end

end