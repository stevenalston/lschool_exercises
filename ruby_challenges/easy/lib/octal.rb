# P: Convert a String object representing an octal, to a Integer object representing a decimal.
# implicit - octals range from 0 - 7
# E:
# 233 # decimal
# = 2*10^2 + 3*10^1 + 3*10^0
# = 2*100  + 3*10   + 3*1
#
# 233 # octal
# = 2*8^2 + 3*8^1 + 3*8^0
# = 2*64  + 3*8   + 3*1
# = 128   + 24  + 3
# = 155
# D:
#   Input - String object
#   Output - Integer object
# A:
#  - Convert String to an Integer
#  - Iterate over the digits keep reference of the index
#     multiple the digit by 8^index
#   return a new array and sum the array
#

class Octal
  def initialize(oct_str)
    @oct_str = oct_str
  end

  def to_decimal
    return 0 unless @oct_str.match(/^[0-7]+$/)

    @oct_str.to_i.digits.map.with_index do |val, i|
      return 0 if val > 7
      val * 8**i
    end
    num_arr.sum
  end
end
