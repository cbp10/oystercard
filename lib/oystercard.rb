require_relative 'journeyLog'
require_relative 'stations'

class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys, :journeylog

  def initialize(balance = 0)
    @balance = balance
    @journeylog = JourneyLog.new
  end

  def top_up(amount)
    fail "Balance limit of £#{BALANCE_LIMIT} exceeded" if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(entry_station)
    fail 'Insufficient funds to travel' if balance < MINIMUM_BALANCE
    @journeylog.start(entry_station)
  end

  def touch_out(exit_station)
    @journeylog.finish(exit_station)
    deduct(@journeylog.journey_class.fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end

oc = Oystercard.new(20)

st1 = Stations.new({name: :XX, zone:2})
st2 = Stations.new({name: :YY, zone:5})

oc.touch_in(st1)
oc.touch_out(st2)

p oc.journeylog.journeys
















