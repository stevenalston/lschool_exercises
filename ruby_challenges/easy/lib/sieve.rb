# Sieve of Eratosthenes
# Write a program that uses the Sieve of Eratosthenes to find all the primes from 2 up to a given number.
#
# The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit. It does so by iteratively marking as composite (i.e. not prime) the multiples of each prime, starting with the multiples of 2.
#
# Create your range, starting at two and continuing up to and including the given limit. (i.e. [2, limit]).
#
# The algorithm consists of repeating the following over and over:
#
# take the next available unmarked number in your list (it is prime)
# mark all the multiples of that number (they are not prime)
# Repeat until you have processed each number in your range. When the algorithm terminates, all the numbers in the list that have not been marked are prime. The wikipedia article has a useful graphic that explains the algorithm.
#
# Notice that this is a very specific algorithm, and the tests don't check that you've implemented the algorithm, only that you've come up with the correct list of primes.
#
# https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
#
# P:
#
# E:
#   Sieve.new(10) # => [2, 3, 5, 7]
#
# D:
#   Input - Integer
#   Output - Array of Integers
#
# A:
#   - set range = Array of integers 2 through n
#   - set result = []
#   - set rejects = []
#   - iterate through range - set int
#     - iterate through range - set val
#       - rejects << int * val
#   - range_array reject vals in rejects_array
#
#
# C:

class Sieve
  def initialize(n)
    @n = n
  end

  def primes
    prime_candidates = [*2..@n]
    composites = []

    prime_candidates.each do |int|
      prime_candidates.each { |val| composites << int * val }
    end
    prime_candidates - composites
  end
end
