require 'oystercard'

describe Oystercard do

  it 'on initialization has a balance by default' do
    expect(subject.balance).to eq 0
  end

  it 'tops up the balance' do
    subject.top_up(10)
    expect(subject.balance).to eq 10
  end

end
