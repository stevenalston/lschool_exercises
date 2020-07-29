=begin

  P:
    Generate a key for decoding text. based on the character the letter is shifted to the nth position. Ex. (a = 0 , d = 3)
    keys: composed of only lowercase letters
  E:

  D:

    Input:

    Output:

  A:
    # generate_key
    Iterate 100 times
      SAMPLE over a range of letters 'a' through 'z'

    #encode
    input: String (key instance variable)
    output: encoded string

    SET: result = ''
    SET: ascii_vals (MAP characters to ascii_code vals)
    
    FOREACH char in input string GET char and idx
      letter_idx = ascii_val - 97
      shift_val = key[idx] ascii
      IF first_half ('a'..'m') 
        IF: letter_idx <= 12 || (letter_idx + shift_val) < 26
          THEN: translate (ascii_code + shift_val).chr
          APPEND: encoded_char to result
      IF: second_half ('n'..'z')
        IF: letter_idx >= 13 && (letter_idx + shift_val) > 25
          THEN: ascii_val starts at 97 (ascii_val + shift_val).chr
          APPEND: encoded_char to result
      RETURN result string

      #decode
      input: String (key instance variable)
      output: encoded string

      SET: result = ''
      SET: ascii_vals (MAP characters to ascii_code vals)

      FOREACH char in input string GET char and idx
        letter_idx = ascii_val - 97
        shift_val = key[idx] ascii
        IF first_half ('a'..'m')
          IF: letter_idx <= 12 || (letter_idx - shift_val) >= 0
            THEN: translate (ascii_code - shift_val).chr
            APPEND: encoded_char to result
        IF: second_half ('n'..'z')
          IF: letter_idx >= 13 
            THEN: ascii_val starts at 123 (ascii_val + 26 - shift_val).chr
            APPEND: encoded_char to result
        RETURN result string
  C:

=end

class Cipher
  attr_reader :key  # => nil

  def initialize(key = nil)
    if !key
      @key = generate_key
    elsif key.match(/\A[a-z]+\z/)
      @key = key
    else
      raise ArgumentError
    end
  end

  def encode(text)
    result = ''
    ascii_vals = generate_ascii_vals(text) 

    text.chars.each_with_index do |char, i|
      letter_idx = ascii_vals[i] - 97
      shift_val = key[i].ord - 97

      if letter_idx <= 12 || letter_idx + shift_val < 26
        result += (ascii_vals[i] + shift_val).chr
      elsif letter_idx >= 13 && letter_idx + shift_val > 25
        result += ((ascii_vals[i] - 26) + shift_val).chr
      end
    end
    result # => "zabcdefghi"
  end                                                                                          

  def decode(text)
    result = ''
    ascii_vals = generate_ascii_vals(text)

    text.chars.each_with_index do |_char, i|
      letter_idx = ascii_vals[i] - 97
      shift_val = key[i].ord - 97

      if letter_idx <= 12 || letter_idx - shift_val >= 0
        result += (ascii_vals[i] - shift_val).chr
      elsif letter_idx >= 13 && letter_idx + shift_val > 25
        result += ((ascii_vals[i] + 26) - shift_val).chr
      end
    end
    result # => "zabcdefghi"
  end                                                                                           # => :decode

  private                                             # => Cipher
  def generate_key
    result = ''
    100.times {|_| result += ('a'..'z').to_a.sample}
    result
  end                                                 # => :generate_key

  def generate_ascii_vals(text)
    text.chars.map {|char| char.ord}
  end                                                              # => :generate_ascii_vals
end                                                                # => :generate_ascii_vals

