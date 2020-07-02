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

  p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
  p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
  p rotate_array(['a']) == ['a']

  x = [1, 2, 3, 4]
  p rotate_array(x) == [2, 3, 4, 1]   # => true
  p x == [1, 2, 3, 4]  