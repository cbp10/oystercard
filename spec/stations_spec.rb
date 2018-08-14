require 'stations'

describe Stations do
subject { Stations.new(name: "Victoria", zone: 1) }

  it 'to expose a name variable' do
    expect(subject.name).to eq "Victoria"
  end

  it 'to expose a zone variable' do
    expect(subject.zone).to eq 1
  end
end
