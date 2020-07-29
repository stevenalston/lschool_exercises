# frozen_string_literal: true

def convert(str)
  result = ''
  idx = 0

  while idx < str.size
    result += block_given? ? yield(str[idx]) : str[idx]
    idx += 1
  end
  result
end
