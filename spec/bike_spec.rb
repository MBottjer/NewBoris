require 'bike'

describe Bike do

	it 'is not broken when initially rented' do 
		bike = Bike.new
		expect(bike.broken?).to be_false
	end

	it 'can be broken' do
		bike = Bike.new
		bike.break!
		expect(bike.broken?).to be_true
	end

  it 'can be fixed' do
    bike = Bike.new
    bike.break!
    bike.fix

end