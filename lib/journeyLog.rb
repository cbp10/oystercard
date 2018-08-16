require_relative 'journey'

class JourneyLog
  attr_reader :journey_class

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @in = station.name
    @journey_class.start_journey(station)
  end

  def finish(station)
    @out = station.name
    @journey_class.finish_journey(station)
    @journeys << current_journey
    
  end

  def journeys
    @journeys.dup
  end

 private
   def current_journey
    { entry: @in, exit: @out, fare: @journey_class.fare}
  end
end


