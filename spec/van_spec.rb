require 'van'
require 'bike_container_spec'

describe Van do 

	it_behaves_like 'a bike container'

  it 'will not accept a bike if full' do
    bike1 = double :bike
    bike2 = double :bike
    van = Van.new([bike1, bike2], 2)
    bike3 = double :bike
    van.load([bike3])
    expect(van.bike_count).to eq 2
  end

end 