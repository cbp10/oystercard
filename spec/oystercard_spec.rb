require 'oystercard'

describe Oystercard do

  #let(:card) { Oystercard.new }

  it 'on initialization has a balance by default' do
    expect(subject.balance).to eq 0
  end

  it 'on initialization card has empty list of journeys' do
    expect(subject.journeys).to eq []
  end

  describe '#top_up' do

    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "can top up the balance" do
      expect{ subject.top_up 10 }.to change{ subject.balance }.by 10
    end

    it "raises an error when the balance limit is exceeded" do
      expect{ subject.top_up(91) }.to raise_error "Balance limit of £#{Oystercard::BALANCE_LIMIT} exceeded"
    end

  end

  describe '#deduct' do

    it "can deduct the balance" do
      expect{ subject.send(:deduct, 10) }.to change{ subject.balance }.by -10
    end

  end

  describe '#touch_in' do

    it 'can touch in when balance is more than minimum required' do
      subject.top_up(10)
      subject.touch_in("Victoria")
      expect(subject.send (:in_journey?)).to eq(true)
    end

    it 'will not touch in if balance is below minimum balance to travel' do
      expect{ subject.touch_in("Victoria") }.to raise_error 'Insufficient funds to travel'
    end

    it 'records entry station after #touch_in' do
      subject.top_up(10)
      subject.touch_in("Victoria")
      expect(subject.entry_station).to eq "Victoria"
    end

  end

  describe '#touch_out' do

    it 'can touch out' do
      subject.touch_out("Waterloo")
      expect(subject.send (:in_journey?)).to eq(false)
    end

    it 'can deduct funds when journey is complete' do
      expect{subject.touch_out("Waterloo")}.to change{subject.balance}.by -1
    end

    it 'can forgot the #entry_station on #touch_out' do
      subject.top_up(10)
      subject.touch_in("Victoria")
      subject.touch_out("Waterloo")
      expect(subject.entry_station).to eq nil
    end

  end

  describe '#in_journey?' do

    it 'returns false if not on a journey' do
      expect( subject.send ( :in_journey? ) ).to eq false
    end
  end

  describe 'journeys' do
    it 'creates one journey from a #touch_in and #touch_out' do
      subject.top_up(10)
      subject.touch_in("Victoria")
      subject.touch_out("Waterloo")
      expect(subject.journeys).to eq [{"Victoria" => "Waterloo"}]
    end
  end

end
