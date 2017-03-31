class Queue

  def initialize
    @arr = []
  end

  def enqueue(el)
    @arr << el
  end

  def dequeue
    @arr.shift
  end

  def show
    @arr
  end

end

# queue = Queue.new
# queue.enqueue(3) #first one in, so when I remove this should be the one that's out
# queue.enqueue(4)
# queue.enqueue(5)
#
# p queue.show
#
# queue.dequeue
# p queue.show
