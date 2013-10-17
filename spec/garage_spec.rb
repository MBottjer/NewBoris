require 'garage'
require 'bike_container_spec'

describe Garage do 

  it_behaves_like 'a bike container'

  it 'can fix broken bikes' do 
    bike1 = double :bike, broken?: :djdjd 
    garage = Garage.new([bike1])
    expect(bike1).to receive(:fix)
    garage.fix
  end

end