class Journey

  attr_reader :in_progress
  


  def initialize(entry)
    @in_progress = true
    @entry_station = entry
  end


  def complete(exit)
    @in_progress = false
    @exit_station = exit
  end

  def fare
    @exit_station == nil ? Oystercard::PENALTY_FARE : Oystercard::MINIMUM_FARE
  end
    



end



# call fare on any journey object