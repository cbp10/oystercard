require 'oystercard'

describe Oystercard do

  let(:card) { Oystercard.new(10) }
  let(:entry_station) { double :station}
  let(:exit_station) { double :station}

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
      expect(card.touch_in(entry_station)).to respond_to(:in_progress)
    end

    it 'will not touch in if balance is below minimum balance to travel' do
      expect{ subject.touch_in(entry_station) }.to raise_error 'Insufficient funds to travel'
    end

  end

  describe '#touch_out' do
    
    it 'can deduct funds when journey is complete' do
      card.touch_in(entry_station)
      expect{card.touch_out(exit_station)}.to change{card.balance}.by -1
    end

    it 'can forgot the #entry_station on #touch_out' do
      allow(card).to receive(:balance) { 10 }
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      expect(card.entry_station).to eq nil
    end

  end


end
