
shared_examples 'a bike container' do
	
  let(:container) { described_class.new }
  let(:bike) { double :bike, { broken?: false } }
  let(:broken_bike) { double :bike, { broken?: true } }

	it 'can tell us when there are no bikes available' do 
		expect(container.bike_available?).not_to be_true
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

  it 'releases a broken bike to the container requesting one' do
    other = double :other
    container.load [broken_bike]
    expect(other).to receive(:load).with([broken_bike])
    container.release_broken_bikes_to other
  end

  it 'has no broken bikes after releasing them' do
    other = double :other, { load: nil }
    broken_bike2 = double :bike, { broken?: true }
    container.load [broken_bike, broken_bike2]
    container.release_broken_bikes_to other
    expect(container.bike_count).to eq 0
  end

  it 'releases all working bikes to the container requesting them' do
    bike2 = double :bike, { broken?: false }
    bike3 = double :bike, { broken?: false }
    other = double :other
    container.load [bike, bike2, bike3]
    expect(other).to receive(:load).with([bike, bike2, bike3])
    container.release_working_bikes_to other
  end

  it 'has no working bikes after releasing them' do
    bike2 = double :bike, { broken?: false }
    bike3 = double :bike, { broken?: false }
    other = double :other, { load: nil }
    container.load [bike, bike2, bike3]
    container.release_working_bikes_to other
    expect(container.bike_count).to eq 0
  end

  it 'will accept as many bikes as it has space for' do
    bike1 = double :bike
    bike2 = double :bike
    bike3 = double :bike
    container = described_class.new([bike1], 2)
    container.load([bike2, bike3])
    expect(container.bike_count).to eq 2
  end

  it 'keeps any bikes that are not accepted by other container' do
    bike1 = double :bike, { broken?: false }
    bike2 = double :bike, { broken?: false }
    bike3 = double :bike, { broken?: false }
    container1 = described_class.new([bike1, bike2], 2)
    container2 = described_class.new([bike3])
    container2.release_working_bikes_to container1
    expect(container2.bike_count).to eq 1
  end

end