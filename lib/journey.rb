require_relative 'fare_mod'

class Journey
  include FareMod

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @in_progress = true
  end

  def start_journey(station)
    @start_zone = station.zone
  end

  def finish_journey(station)
    @end_zone = station.zone
  end

  def complete?
    !!@start_zone && !!@end_zone
  end

  def fare  
    return PENALTY_FARE unless complete?
    peak_fare([@start_zone, @end_zone]).round(2)
  end
end