class Map
  #map stores information in key-value pairs.
  def initialize
    @store = [[]]
  end

  def assign(key, val)
    found_key = false
    @store.each do |pair|
      if pair.first == key
        pair[1] = val
        found_key = true
      end
    end
    unless found_key
      @store.first.empty? ? @store = [[key, val]] : @store << [key, val]
    end
  end

  def lookup(key)
    @store.each do |pair|
      return pair.last if pair.first == key
    end
    nil
  end

  def show
    @store
  end

end
# Test cases:
# map = Map.new
# map.assign(3, 4)
# map.assign(4,5)
# map.assign(2,5)
#
# p map.show
#
# map.assign(2,1000) #should replace 2 with 1000
# p "After update:"
# p map.show
