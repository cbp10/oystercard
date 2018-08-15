require_relative 'journey'

class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1
  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :exit_station, :journeys, :journey

  def initialize(balance = 0)
    @balance = balance
    @journeylog = JourneyLog.new(Journey)
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
    deduct(MINIMUM_FARE)
    @journeylog.finish(exit_station)
  end

  private
  def deduct(amount)
    @balance -= amount
  end

end
