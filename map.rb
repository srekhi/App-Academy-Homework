class Map
  #map stores information in key-value pairs.
  def initialize
    @store = []
  end

  def assign(key, val)
    key_index = @store.find_index { |pair| pair.first == key }
    key_index ? @store[key_index] = [key, val] : @store << [key, val]
  end

  def lookup(key)
    @store.each { |pair| return pair.last if pair.first == key }
    nil
  end

  def remove(key)
    #instead of iterating through to find the index, then deleting it. just reject the index
    #where the condition fits.
    @store.reject! { |pair| pair.first == key }
  end
  
  def show
    @store
  end

end


# class Map
#   def initialize
#     @map = []
#   end
#
#   def assign(key, value)
#     pair_index = @map.index {|pair| pair[0] == key}
#     pair_index ? @map[pair_index][1] = value : @map.push([key, value])
#     [key, value]
#   end
#
#   def lookup(key)
#     @map.each {|pair| return pair[1] if pair[0] == key}
#     nil
#   end
#
#   def remove(key)
#     @map.reject! {|pair| pair[0] == key}
#     nil
#   end
#
#   def show
#     deep_dup(@map)
#   end
#
#   private
#   def deep_dup(arr)
#     arr.map { |el| el.is_a?(Array) ? deep_dup(el) : el }
#   end
# end
#Test cases:
map = Map.new
map.assign(3, 4)
map.assign(4,5)
map.assign(2,5)

p map.show

map.assign(2,1000) #should replace 2 with 1000
p "After update:"
p map.show
