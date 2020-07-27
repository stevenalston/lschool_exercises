=begin

  P: Write a program that, given a 3 x 4 grid of pipes, underscores, and spaces, can determine which number is
  represented, or whether it is garbled. 4 rows high, 3 cols wide



  E: 
  text = <<~NUMBER.chomp
#    _   #
#   | |  # zero.
#   |_|  #
#        # the fourth row is always blank
# NUMBER # => '0'

  D:

    Input: Heredoc - Is that a String?

    Output: String - Representing an Integer

  A:

    SET- Create a hash where the key represents the digit, and the value is a pattern that makes up each letter

    * I don't believe the following will evaluate multiple nums at a time
      - maybe there needs to be some step every 3
    ITERATE- hash 
      IF- hash[key] == text.chars 
        key is concatenated to result String
      ELSE - question mark

    ELSE-

    PRINT-

  C:

=end

class OCR
  def initialize(text)
    @text = text
  end

  def convert

  end
end
