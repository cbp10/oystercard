module FareMod

  FARES = {"1"=>[2.4, 2.4], "1-2"=>[2.9, 2.4], 
          "1-3"=>[3.3, 2.8], "1-4"=>[3.9, 2.8],
          "1-5"=>[4.7, 3.1], "1-6"=>[5.1, 3.1],
          "2-6"=>[2.8, 1.5]}

  def peak?(t)
    return true if t > '0629' && t < '0930'
    return true if t > '1559' && t < '1900'
    false
  end

  def peak_fare(array)
    key = zones_to_key(array)
    FARES[key][0]
  end

  def off_peak_fare(array)
    key = zones_to_key(array)
    FARES[key][1]
  end

  private

  def zones_to_key(array)
    return "2-6" if array[0] != 1 && array[1] != 1
    return "1" if array[0] == 1 && array[1] == 1
    FARES.keys[array.max-1]
  end
end