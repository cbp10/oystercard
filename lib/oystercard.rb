class Oystercard

  BALANCE_LIMIT = 90
  MINIMUM_BALANCE = 1

  attr_reader :balance, :entry_station
  #attr_accessor :in_journey

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Balance limit of £#{BALANCE_LIMIT} exceeded" if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in(entry_station)
    fail 'Insufficient funds to travel' if @balance < MINIMUM_BALANCE
    @entry_station = entry_station
  end

  def touch_out
    deduct(1)
    @entry_station = nil
  end

  private
  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @entry_station == nil ? false : true
  end

end
