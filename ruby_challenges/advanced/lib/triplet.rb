=begin

  P:
  A Pythagorean triplet is a set of three natural numbers, {a, b, c}, for which, a**2 + b**2 = c**2
  the #where method should return a instance variable where the array elements create a Pythagorean triplet.

  E:
  3**2 + 4**2 = 9 + 16 = 25 = 5**2
  where(max_factor: 10)
    [1]
  D:

    Input: 

    Output:

  A: Triplet::where
    get the keys passed into the objects - should methods be created which are related to the keys?
    max_factor, min_factor, sum
    - calculate each val, select the pythagorean triplets
  C:

=end

class Triplet 
  include Enumerable

  def initialize(*args)
    @nums_ary = args
  end

  def product
    @nums_ary.reduce(&:*)
  end

  def sum
    @nums_ary.reduce(&:+)
  end

  def pythagorean?
    (@nums_ary[0] ** 2) + (@nums_ary[1] ** 2) == @nums_ary.last ** 2
  end

  def self.where(**factors)
    calc_triplets(**factors)
  end

  def self.calc_triplets(min_factor: 1, max_factor: 1, sum: nil)
    result = []
    (min_factor..max_factor).to_a.combination(3) do |ary|
      test_trip = Triplet.new(*ary)
      if !sum
        result << test_trip if test_trip.pythagorean?
      else
        result << test_trip if test_trip.pythagorean? && sum == test_trip.sum 
      end
    end
    result # => #<Triplet:0x00007ffc9083c540 @nums_ary=[6, 8, 10]>
  end
end

# p Triplet.new(3, 4, 5).sum # => 12
# p Triplet.new(3, 4, 5).product # => 60
# p Triplet.new(3, 4, 5).pythagorean? # => true
# p !Triplet.new(5, 6, 7).pythagorean? # => true
p Triplet.where(max_factor: 10) # => #<Triplet:0x00007ffc9083c540 @nums_ary=[6, 8, 10]>

# >> #<Triplet:0x00007ffc9083c540 @nums_ary=[6, 8, 10]>
