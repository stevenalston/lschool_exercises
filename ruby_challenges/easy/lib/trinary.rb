=begin

  P: Convert the inputted String object whihch represents a Trinary number to its decimal equivolant. Trinary numbers are represented by the digits 0 - 2. 

  E:
#  "102012"
#     1       0       2       0       1       2      # the number
#   1*3^5 + 0*3^4 + 2*3^3 + 0*3^2 + 1*3^1 + 2*3^0    # the value
#   243 +     0 +    54 +     0 +     3 +     2   =  302

  D:

    Input: String

    Output: Integer

  A:

    - check the string with regex making sure it only contains the digits 0 - 2
    - convert the trinary string to an integer
    - iterate through the digits 
    - for each val, val * 3^idx
    - sum the array

  C:

=end

class Trinary
  attr_reader :tri

  def initialize(trinary)
    @tri = trinary
  end

  def to_decimal
    return 0 unless valid_input(tri)
    tri.to_i.digits.map.with_index {|digit, idx| digit * 3 ** idx}.sum
  end

  private
  def valid_input(str)
    str.match /^[0-2]+$/
  end

end
