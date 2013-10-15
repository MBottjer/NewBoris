require 'person'

describe Person do 

	it 'initially has no bike' do
		person = Person.new 
		expect(person).not_to have_bike
	end

	it 'can have bike' do
		person = Person.new :bike
		expect(person).to have bike
	end


end