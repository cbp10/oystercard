require 'journey'

describe Journey do
    entry_station = "Victoria"
    exit_station = "Aldgate"
    journey = Journey.new
    let(:s1) { double :station, zone: 1 }
    let(:s2) { double :station, zone: 2 }

  describe "#complete?" do  
    it "returns false if the journey is not complete" do
      expect(subject.complete?).to eq false
    end

    it "returns true if the journey is complete" do
      subject.start_journey(s1)
      subject.finish_journey(s2)
      expect(subject.complete?).to eq true
    end
  end


  describe "#fare" do
    it "returns the penalty fare if entry or exit station is nil" do
      journey.start_journey(s1)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "returns the minimum fare for complete journeys" do
      journey.start_journey(s1)
      journey.finish_journey(s2)
      expect(journey.fare).to eq Journey::MINIMUM_FARE
    end
  end
  
  describe '#start_journey' do
    it 'sets entry zone to entry zone number' do
      expect(subject.start_journey(s1)).to eq 1
    end
  end
  
  describe '#finish_journey' do
    it 'sets exit zone to exit zone number' do
      expect(subject.finish_journey(s2)).to eq 2
    end
  end
end