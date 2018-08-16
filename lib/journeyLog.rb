require_relative 'journey'

class JourneyLog
  attr_reader :journey_class, :in, :out

  def initialize(journey_class = Journey.new)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @in = station.name
    @journeys << current_journey
    @journey_class.start_journey(station)
  end

  def finish(station)
    @out = station.name
    @journey_class.finish_journey(station)
    @journeys << current_journey if @journeys.empty?
    @journeys[-1] = current_journey
  end

  def journeys
    @journeys.dup
  end

 private

   def current_journey
    { entry: @in, exit: @out, fare: @journey_class.fare}
  end
end