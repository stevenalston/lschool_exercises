
class Series
  def initialize(str)
    @str = str 
  end

  def slices(n)
    raise ArgumentError if n > @str.length
    
    @str.chars
      .map(&:to_i)
      .each_cons(n)
      .each_with_object([]) {|val, obj| obj << val}
    
  end
end

series = Series.new('01234')
p series.slices(1) == [[0], [1], [2], [3], [4]]
