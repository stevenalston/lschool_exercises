# P
# Problem domain -
# A triangle, visualised with row following each other verically.
# A number on a row  is computed by looking at the row before and adding the numbers that appear to the above-left and above-right of the current number.
#
# Mental model:
# Return the series of numbers that represent each row in a Pascal's triangle series of rows, given the row number n. In Pascal's triangle, the number in a row is calculated by adding the two numbers that are displayed above left and above right WHEN the series is displayed as a triangle.
#
# E:
#
# D:
#   Input = int
#   Output = a two dimensional array, each inner array represents a row
#
# A:
# calculate the current elements value by using the indexed position in the previous row by adding the values at  val[index - 1] + val[index]
#
#   if no such index exists add 0
#
#    - When generating a new row, rows[n]:
#     - element 0 is 1
#     - element 1 is rows[n-1][0] + row[n-1][1]
#    -  element 2 is rows[n-1][1] + row[n-1][2]
#    -  elemen 3 is rows[n-1][2] +
#    -  element m is rows[n-1][m-1] + rows[n-1][m]
#    -  last element is always 1
#    -
#
#    - SET result = []
#    - Iterate 0 - total_rows
#    - SET sub_array = []
#    - Iterate j = idx + 1
#       - if result.size > 1
#           push (result[idx][j - 1] + result[idx][j]) to sub_array
#       - else push 1 to sub_array
#    - push sub_array to result
#    return result

class Triangle
  def initialize(total_rows)
    @total_rows = total_rows
  end

  def rows
    triangle = [[1], [1, 1]]
    return [triangle[0]] if @total_rows == 1
    return triangle if @total_rows == 2

    1.upto(@total_rows - 2) do |row_idx|
      row = [1]
      row_el = 1
      row_size = row_idx
      while row_el < row_size + 1
        prev_row = triangle[row_idx]
        row << (prev_row[row_el - 1] + prev_row[row_el])
        row_el += 1
      end
      row << 1
      triangle << row
    end
    triangle
  end
end
