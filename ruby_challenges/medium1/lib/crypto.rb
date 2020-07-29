class Crypto
  def initialize(str)
    @plain_text = str

  end

  def normalize_plaintext
    @plain_text.gsub(/\W+/, '').downcase
  end

  def size
    Math.sqrt(normalize_plaintext.size).ceil
  end

  def plaintext_segments
    result = []
    str = normalize_plaintext 
    idx = 0
 
    while idx < normalize_plaintext.size
      temp = ''
      (0...size).each do |_|
        temp += str[idx] if str[idx]
        idx += 1
      end
      result << temp
    end
    result
  end

  def ciphertext
    
  end
end

p Crypto.new('Oh hey, this is nuts!').ciphertext # => ["ohhe", "ythi", "sisn", "uts"]

# >> "ohheythisisnuts"
# >> 4
# >> ["ohhe", "ythi", "sisn", "uts"]
