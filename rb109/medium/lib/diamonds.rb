=begin

  P:
  Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.
  coordinates (x, y) 
  spaces
  stars 
  E:
  diamond(3)

    *
   ***
    *
  diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
  D:

    Input: odd Integer

    Output: String

  A:

    SET- space_counter = n - star_counter , star_counter = 0, space = ' ', star = '*'

    WHILE- n.times
      WHILE- space_counter > 0 
        PRINT space
      WHILE - star_counter <= n
      INC - star_counter += 2

    IF-

    ELSE-

    PRINT-

  C:

=end
[1, 2, 3].map {|x| x ** 3 }
