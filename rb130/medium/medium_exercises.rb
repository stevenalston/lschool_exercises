# Listening Device
# Below we have a listening device. It lets us record something that is said and store it for later use. In general,
# this is how the device should be used:
#
# Listen for something, and if anything is said, record it for later use. If nothing is said, then do not record anything.

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    @recordings.last
  end
end

# Anything that is said is retrieved by this listening device via a block. If nothing is said, then no block will be
# passed in. The listening device can also output the most recent recording using a Device#play method.

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"


#Text Analyzer

#Fill out the rest of the Ruby code below so it prints output like that shown in "Sample Output." You should read the
# text from a simple text file that you provide. (We also supply some example text below, but try the program with your
# text as well.)
#
# This question requires that you read a simple text file. Try searching the Web for information on how to do this,
# and also take a look at the File class in the Ruby documentation. If you can't figure it out on your own, don't worry:
# just put the data directly into your program; an Array with one element per line would be ideal.
#
# Read the text file in the #process method and pass the text to the block provided in each call. Everything you need to
# work on is either part of the #process method or part of the blocks. You need no other additions or changes.
#
# The text you use does not have to produce the same numbers as the sample output but should have the indicated format.

class TextAnalyzer
  def process
    # your implementation
    file = File.open('./analyzer.txt', 'r+')
    yield(file)
    file.close
  end
end

analyzer = TextAnalyzer.new
# analyzer.process {|f| puts "#{f.readlines.join.split(/\n\n/).count} paragraphs" } # => 3 paragraphs
# analyzer.process { |f| puts "#{f.readlines.count} lines" } # => 15 lines
# analyzer.process {|f| puts "#{f.readlines.join.split.count} words" } # => 126 words

# LSchool
# class TextAnalyzer
#   def process
#     file = File.open('sample_text.txt', 'r')
#     yield(file.read)
#     file.close
#   end
# end
#
# analyzer = TextAnalyzer.new
# analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
# analyzer.process { |text| puts "#{text.split("\n").count} lines" }
# analyzer.process { |text| puts "#{text.split(' ').count} words" }

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# gather(items) do |*item, last_item|
#   puts "#{item.join(', ')}"
#   puts "#{last_item}"
# end

# gather(items) do |first_item, *item, last_item|
#   puts "#{first_item}"
#   puts "#{item.join(', ')}"
#   puts "#{last_item}"
# end
#
# gather(items) do |first_item, *item|
#   puts "#{first_item}"
#   puts "#{item.join(', ')}"
# end
#
# gather(items) do | item1, item2, item3, item4|
#   puts "#{item1}, #{item2}, #{item3}, and #{item4}"
# end

def convert_to_base_8(n)
  n.to_s(8).to_i # replace these two method calls
end

# The correct type of argument must be used below
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
# p [8, 10, 12, 14, 16, 33].map(&base8_proc)

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index]
      end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p p array == [3, 5]

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = [6, 12, 27, 22, 14]
bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
p array == [14, 22, 12, 6, 27]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array)
p array == %w(Kim Pete Tyler alice bonnie rachel sue)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)
