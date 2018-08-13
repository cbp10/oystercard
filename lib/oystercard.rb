class Oystercard

  BALANCE_LIMIT = 90

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Balance limit of £#{BALANCE_LIMIT} exceeded" if (@balance + amount) > BALANCE_LIMIT
    @balance += amount
  end

end
