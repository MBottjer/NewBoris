

shared_examples 'a bike container' do
	let(:container) { described_class.new }

	let(:bike) { double :bike, {broken?: false} }
  let(:broken_bike) { double :bike, {broken?: true} }

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

  # it 'releases broken bike to the van' do 
  #   container.dock broken_bike
  #   expect(container.release_to_van).to eq [broken_bike]
  # end

end