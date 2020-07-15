=begin

  P: given an Array of integers, find the multiples of those integers from 1 upto, but not including, n
     sum the multiples and output the sum. 
     Implicit: The method is called as a class method and an instance method. 
  E:

  D:

    Class Input: Random amount of Integers
    Method Input: Integer
    Output: Integer

  A:
    1/ initialize a set of numbers to multiple by when method is called on an instance
    2/ create a class method 'to'
    3/ SOM#to should take 2 parameters 'limit, base_set' with base_set have default params
    4/ SET mulitples = []
    5/ Iterate 1...n
    6/ Iterate base_set
      a/ push base_set els * range_vals to []
    7/ select/filter unique els from the multiples []
      a/ check whether el is truthy and > limit
    8/ return multiples []

    9/ create a instance method 'to' that takes 1 param 'limit'
    10/ call the SOM class method passing in the instance variable @set

  C:

=end

class SumOfMultiples
  
  def initialize(*args)
    @number_set = args 
  end

  def self.to(n, base_nums = [3, 5])
    multiples = []
    raise "Please enter a positive number" unless n > 0
    (0...n).each { |val| base_nums.size.times { |idx| multiples << (base_nums[idx] * val) } }
    multiples.uniq.select { |multiple| multiple && multiple < n }.sum
  end

  def to(n)
    self.class.to(n, @number_set)
  end
end

p SumOfMultiples.new(7, 13, 17).to(20) == 51


