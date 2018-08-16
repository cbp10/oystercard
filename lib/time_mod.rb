require 'date'

module TimeMod

  def time
    hour + minute
  end

  def peak?(t)
    return true if t > '0629' && t < '0930'
    return true if t > '1559' && t < '1900'
    false
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


class NewClass
  include TimeMod
end

nc = NewClass.new

t = nc.time
p t
p nc.peak?(t)