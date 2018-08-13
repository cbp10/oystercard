class Oystercard

  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    fail "Balance limit exceeded" if (@balance + amount) > 90
    @balance += amount
  end

end
