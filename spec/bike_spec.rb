require 'bike'

describe Bike do

	let(:bike) { Bike.new }

	it 'is not broken when initially rented' do 
		expect(bike.broken?).to be_false
	end

	it 'can be broken' do
		bike.break!
		expect(bike.broken?).to be_true
	end

  it 'can be fixed' do
    bike.break!
    bike.fix
  end

end