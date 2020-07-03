=begin

  P: Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.
  
  Do not use the method Array#rotate or Array#rotate! for your implementation.

  E:
  rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
  rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
  rotate_array(['a']) == ['a']

  x = [1, 2, 3, 4]
  rotate_array(x) == [2, 3, 4, 1]   # => true
  x == [1, 2, 3, 4]  

  D: 

    Input: Integer

    Output: String

  A:

    ITERATE- through given array
    SET - local variable 'last_el' to last element of the Array
    SET - 'last_el' to be the first element of the Array
    RETURN - Array

  C:
=end

def rotate_array(array)
  arr = array.clone
  first_el = arr.shift
  arr << first_el
end

# lachool solution
def rotate_array_ls(array)
  array[1..-1] + [array[0]]
end

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']
x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]  

=begin
  P: define a method which takes 2 args. The first arg is an Integer, the second in also an Integer
  which specifies how many of the right most digits should be rotated. 

  'n' is always a positive integer
  E:
  rotate_rightmost_digits(735291, 1) == 735291
  rotate_rightmost_digits(735291, 2) == 735219
  rotate_rightmost_digits(735291, 3) == 735912
  rotate_rightmost_digits(735291, 4) == 732915
  rotate_rightmost_digits(735291, 5) == 752913
  rotate_rightmost_digits(735291, 6) == 352917
  D:

    Input: (int, int)

    Output: int

  A:

    SET- local var 'arr' to the digits of the Integer
      - reverse arr
    SET - local var 'd' = REMOVE digit 'n'
    APPEND - removed digit to the end of 'arr'
    RETURN - arr as an Integer

  C:
=end

def rotate_rightmost_digits(int, n)
  arr = int.digits.reverse
  d = arr.delete_at(-n)
  (arr << d).join.to_i
end

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 73
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

# Lschool solution
def rotate_rightmost_digits_ls(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array_ls(all_digits[-n..-1])
  all_digits.join.to_i
end

=begin

  P: If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in
  place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to
  321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in
  place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original
  number.

  Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.
  
  Note that you do not have to handle multiple 0s.

  E:
  max_rotation(735291) == 321579
  max_rotation(3) == 3
  max_rotation(35) == 53
  max_rotation(105) == 15 # the leading zero gets dropped
  max_rotation(8_703_529_146) == 7_321_609_845

  D:

    Input: Integer

    Output: Integer

  A:

    SET- local 'arr' to an Array of each digit in the input Integer 
      - reverse arr
    ITERATE- through the array keep track of the index
    EXECUTE= rotate_rightmost digit(arr, index)
    RETURN- 'arr' 

  C:

=end
def max_rotation(number)
  size = number.digits.size
  temp = nil
  while size > 0
    temp = rotate_rightmost_digits(number, size) 
    number = temp
    size -= 1
  end
  temp
end

  p max_rotation(735291) == 321579
  p max_rotation(3) == 3
  p max_rotation(35) == 53
  p max_rotation(105) == 15 # the leading zero gets dropped
  p max_rotation(8_703_529_146) == 7_321_609_845