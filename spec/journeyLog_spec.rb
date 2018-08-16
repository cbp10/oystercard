require 'journeyLog'

describe JourneyLog do
  let(:st1) { double :station, name: :XX, zone: 1 }
  let(:st2) { double :station, name: :YY, zone: 3 }

  it 'initialises with an empty array' do
    expect(subject.journeys.empty?).to be true
  end

  describe '#start' do
    it 'sets @in to station name' do
      subject.start(st1)
      expect(subject.in).to eq :XX
    end

    it 'passes to journey_log to get the zone number' do
      expect(subject.start(st1)).to eq 1
    end
  end

  describe '#finish' do
    it 'sets @out to station name' do
      subject.finish(st2)
      expect(subject.out).to eq :YY
    end

    it 'returns a hash of the journey info' do
      subject.start(st1)
      expect(subject.finish(st2)).to eq({entry: :XX, exit: :YY, fare: 3.3})
    end
  end

  describe '#journeys' do
    it 'returns the journey history' do
      subject.start(st1)
    subject.finish(st2)
    expect(subject.journeys).to eq [{entry: :XX, exit: :YY, fare: 3.3}]
    end
  end
end
