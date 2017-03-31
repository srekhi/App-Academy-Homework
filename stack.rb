class Stack

  def initialize
    @arr = []
  end

  def add(el)
    @arr << el
  end

  def remove
    @arr.pop
  end

  def show
    @arr
  end

end
# 
# stack = Stack.new
# stack.add(3)
# stack.add(4)
# stack.add(5) #last one in, so when I remove this should be the one that's out.
#
# p stack.show
#
# stack.remove
# p stack.show
