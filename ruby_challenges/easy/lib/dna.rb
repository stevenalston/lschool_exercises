=begin

  P:
  find the amount/count of difference between 2 strings

  E:
#   GAGCCTACTAACGGGAT
#   CATCGTAATGACGGCCT
#   ^ ^ ^  ^ ^    ^^
#   => 7

  D:

    Input: String

    Output: Integer

  A:
  1. Initialize class to accept a String arg


  C:

=end

require 'pry'

class DNA 
  def initialize sequence
    @sequence = split_string sequence
  end

  def hamming_distance(str)
    test_sequence = split_string str
    count = 0
    @sequence.each_with_index do |el, i| 
      # binding.pry
      if el || test_sequence[i]
        count += 1 if el != test_sequence[i]
      else 
        count += 1
      end
    end
    count
  end
  
  private
  def split_string(str)
    str.upcase.chars
  end
end

p DNA.new('GGACTGA').hamming_distance('GCACTTA') == 0
