=begin

  P: Given a word and a list. Match all elements from the list that contain the letters of the word

  E:
  detector = Anagram.new('diaper') 
  anagrams = detector.match([hello, world, zombies, pants])
  anagrams = []

  D:

    Input: String, Array

    Output: Array

  A:
  Initialize with a word arg
  define match method(list)
    1. SET - result = []
    2. SET - word_chars = {}
      a. ITERATE through word arg characters setting word_chars hash
    3. ITERATE through the array arg
      if element.size != word.size reject the element
      ITERATE with hash through characters of approved_els 
        SET compare_chars = { } for approved_els
      if compare_chars == word_chars push to result
    4. return result
  C:

=end

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(word_list)
    word_hash = @word.chars.each_with_object({}) {|char, hash| hash[char] ? hash[char] += 1 : hash[char] = 1}
    approved_list = word_list.select {|list_el| list_el.size == @word.size && list_el.downcase != @word}
    approved_list.each_with_object([]) do |approved_word, result|
      compare_hash = approved_word.downcase.chars.each_with_object({}) {|char, hash| hash[char] ? hash[char] += 1 : hash[char] = 1} 
      result << approved_word if word_hash == compare_hash
    end
  end

end
