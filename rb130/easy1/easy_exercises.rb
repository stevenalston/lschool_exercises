class Tree
  include Enumerable

  def each; end
  def select; end
  def map; end
  def reduce; end
end

def compute
 block_given? ? yield : 'Does not compute.'
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

def missing(arr)
  result = []
  arr.sort.each_with_index do |val, i |
    if val + 1 != arr[i + 1] && arr[i + 1]
      missing = (val + 1...arr[i + 1]).to_a
      result << missing
    end
  end
  result.flatten.uniq
end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []
#
def divisors(n)
  (1..n).to_a.select {|num| n % num == 0}
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
output = <<OUTPUT
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
OUTPUT

def rot13(str)
  result = ''
  str.chars.each do |char|
    if (char.ord >=65 && char.ord <= 77) || (char.ord >= 97 && char.ord <= 109)
      num = char.ord + 13
      result += num.chr
    elsif (char.ord >= 78 && char.ord <= 90) || (char.ord >= 110 && char.ord <= 122)
      num = char.ord - 13
      p num.chr
      result += num.chr
    else
      result += char
    end

  end
  result
end

# p rot13(output)
#
def any?(collection)
  counter = 0
  while counter < collection.size
    el = collection[counter]
    return true if yield(el)
    counter += 1
  end
 false
end

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false

def all?(collection)
  collection.each {|item| return false unless yield(item)}
  true
end

# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true

def none?(collection)
  collection.each {|item| return false if yield(item)}
  true
end

# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true

def one?(collection)
  result = []
  collection.each {|item| result << item if yield(item)}
  result.size == 1 ? true : false
end

# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false

def count(collection)
  result = []
  collection.each {|item| result << item if yield(item)}
  result.size
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2