class Array
  def my_each(&blk)
    i = 0
    while i < self.length
      blk.call(self[i])
      i += 1
    end
    self
  end

  def my_select(&blk)
    res = []
    self.my_each do |el|
      res << el if blk.call(el)
    end
    res
  end

  def my_reject(&blk) #accepts block, convert it to block.
    self - self.my_select(&blk)
  end

  def my_any?(&blk)
    my_select(&blk).length >= 1
  end

  def my_all?(&blk)
    my_reject(&blk).empty?
  end
  #the below shuffles the array, and for each element in the array
  #yields to the passed in block.

  def random_each
    shuffle.each do |el|
      yield(el)
    end
  end



  def my_sort(&blk) #basically a bubble sort with a proc. #NOTICE--> if we were passing in a proc, we wouldn't need an ampersand.
    #the ampersand block only exists because we need to convert the passed in block to a proc.

    #p blk.nil?
    blk ||= Proc.new { |el1, el2| el1.length <=> el2.length}
    sorted = false
    until sorted
      i = 0
      sorted = true
      while i < self.length - 1
        if blk.call(self[i], self[i+1]) == 1
          self[i], self[i+1] = self[i + 1], self[i]
          sorted = false
        end
        i += 1
      end
    end
    self
  end

  def my_flatten
    res = []
    self.each do |el|
      if el.is_a? Array
        res += el.my_flatten #this doesn't work because it replaces the array with its flattened self.
        #however, it's flattened self is still an array, so we append the array to self. can't do this.
      else
        res += [el]
      end
    end
    res
  end

  def my_zip(*args)
    res = []
    i = 0
    until i == self.length
      sub_arr = []
      sub_arr << self[i]
      args.each { |arr| sub_arr << arr[i]}
      res << sub_arr
      i += 1
    end
    res
  end

  def my_rotate(rot = 1)
    rot = rot % self.length
    self.drop(rot) + self.take(rot)
  end

  def my_join(sep = "")
    res = ""
    i = 0
    while i < self.length
      res += self[i]
      res += sep unless i + 1 == self.length
      i += 1
    end
    res
  end

  # def my_reverse
  #   i = self.length - 1
  #   res = []
  #   i.downto(0) { |i| res << self[i] }
  #   res
  # end

  #recursive:
  def my_reverse
    return self if self.length == 1
    last_el = self.pop
    self.my_reverse.unshift(last_el)
  end


end

def factors(num)
  res = []
  (1...num).each do |n|
    res << n if num % n == 0
  end

  res
end

p factors(7)
