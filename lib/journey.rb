require_relative 'fare_mod'
require_relative 'time_mod'

class Journey
  attr_reader :start_time

  include FareMod
  include TimeMod

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @in_progress = true
  end

  def start_journey(station)
    @start_time = time
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
    peak?(@start_time) ? peak_fare([@start_zone, @end_zone]) : off_peak_fare([@start_zone, @end_zone])
  end
end

