require 'byebug'
class Array
  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &blk)
    i = 0
    if accumulator.nil?
      i += 1
      accumulator = self.first
    end
    while i < self.length
      accumulator = blk.call(accumulator, self[i])
      i += 1
    end
    accumulator
  end
end

# primes(num) returns an array of the first "num" primes.
# You may wish to use an is_prime? helper method.

def is_prime?(num)
  (2...num).each do |n|
    return false if num % n == 0
  end
  true
end

def primes(num)
  res = []
  i = 2
  until res.length == num
    res << i if is_prime?(i)
    i += 1
  end
  res
end

# Write a recursive method that returns the first "num" factorial numbers.
# Note that the 1st factorial number is 0!, which equals 1. The 2nd factorial
# is 1!, the 3rd factorial is 2!, etc.

def factorials_rec(num)
  #first factorial is 0! = 1
  #second is 1! = 1
  return [1] if num == 1
  return [1,1] if num == 2
  prev_facts = factorials_rec(num-1)
  prev_facts << prev_facts[-1] * (num-1)
end

class Array

  # Write an Array#dups method that will return a hash containing the indices of all
  # duplicate elements. The keys are the duplicate elements; the values are
  # arrays of their indices in ascending order, e.g.
  # [1, 3, 4, 3, 0, 3, 0].dups => { 3 => [1, 3, 5], 0 => [4, 6] }

  def dups
    hash = Hash.new { |h, k| h[k] = []}
    self.each_with_index do |el, index|
      hash[el] << index
    end
    hash.select { |k, v| v.length > 1 }
  end
end

class String

  # Write a String#symmetric_substrings method that returns an array of substrings
  # that are palindromes, e.g. "cool".symmetric_substrings => ["oo"]
  # Only include substrings of length > 1.

  def symmetric_substrings
    subs = []
    (0...self.length).each do |beginning_index|
      (beginning_index...self.length).each do |end_index|
        subs << self[beginning_index..end_index]
      end
    end
    subs.select { |sub_str| sub_str.length > 1 && sub_str.reverse == sub_str}
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    prc ||= Proc.new { |el1, el2| el1 <=> el2 }
    return self if self.length <= 1
    mid = self.length / 2
    left = self.take(mid)
    right = self.drop(mid)

    left_sorted = left.merge_sort(&prc)
    right_sorted = right.merge_sort(&prc)

    Array.merge(left_sorted, right_sorted, &prc)

  end

  private

  def self.merge(left, right, &prc)
    i, j = 0, 0
    res = []
    until i == left.length || j == right.length
      if prc.call(left[i], right[j]) == 1
        res << right[j]
        j += 1
      else
        res << left[i]
        i += 1
      end
    end
    (i...left.length).each { |i| res << left[i] }
    (j...right.length).each { |j| res << right[j] }
    res
  end
end
