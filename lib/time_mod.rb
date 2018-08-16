require 'date'

module TimeMod

  def time
    hour + minute
  end

  private

  def hour
    h = rand(24)
    h.to_s.length == 1 ? ("0" + h.to_s) : h.to_s
  end

  def minute
    m = rand(60)
    m.to_s.length == 1 ? ("0" + m.to_s) : m.to_s
  end
end


