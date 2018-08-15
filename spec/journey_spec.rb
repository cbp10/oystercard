require 'journey'


describe Journey do
    entry_station = "Victoria"
    exit_station = "Aldgate"
    journey = Journey.new(entry_station)

  describe "#complete?" do
    
    it "returns false if the journey is not complete" do
      expect(journey.in_progress).to eq true
    end


    it "returns true if the journey is complete" do
      journey.complete(exit_station)
      expect(journey.in_progress).to eq false
    end

  end


  describe "#fare" do
    it "returns the journey fare" do
      journey2 = Journey.new(entry_station)
      expect(journey2.fare).to eq Oystercard::PENALTY_FARE
    end

    it "returns the journey fare" do
      journey.complete(exit_station)
      expect(journey.fare).to eq Oystercard::MINIMUM_FARE
    end
  end




end