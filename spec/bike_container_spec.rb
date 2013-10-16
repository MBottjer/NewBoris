

shared_examples 'a bike container' do
	let(:container) { described_class.new }

	let(:bike) { double :bike, {broken?: false} }

	it 'can tell us when there are no bikes available' do 
		expect(container.bike_available?).not_to be_true
	end

	it 'can accept a bike' do
		expect(container.dock(bike)).to eq [bike]
	end

	it 'can release a bike' do 
		container.dock(bike)
		expect(container.release).to eq bike 
	end

  it 'can say its capacity' do
    expect(container.capacity).to be 5
  end

  it 'can tell when it\'s full' do
    container = described_class.new([bike, bike], 2)
    expect(container.full?).to be_true
  end

  it 'can tell when it\'s not full' do
    expect(container.full?).to be_false
  end

end