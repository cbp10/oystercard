class JourneyLog

  def initialize(journey_class)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @current_journey = @journey_class.new(station)
  end

  def finish(station)
    @current_journey.complete(station)
    @journeys << @current_journey
    @current_journey = nil
  end

  def journeys
    @journeys.dup
  end

 private
   def current_journey
    @current_journey ||= journey_class.new(station)
  end
end


