ENV['RACK_ENV'] = 'test'

require './models/status'

describe "the status model" do

  status = Status.instance
  
  it "has methods get and set" do
    expect(status).to respond_to :get
    expect(status).to respond_to(:set) .with(1) .argument
  end

  it "returns true get when setting status to true" do
    status.set true
    expect(status.get) .to eq true
  end
  
  it "returns false get when setting status to false" do
    status.set false
    expect(status.get) .to eq false
  end

  it "set() returns false when setting status with something else and does not set status" do
    status.set true
    response = status.set "foo"
    expect(response) .to eq false
    expect(status.get) .to eq true

    response = status.set nil
    expect(response) .to eq false
    expect(status.get) .to eq true
  end
end
