#!/usr/bin/env ruby

filename = "67.txt"

triangle = IO.readlines(filename).reverse.map do |line|
  line.split(/\s/).map(&:to_i)
end

max_score = triangle.reduce do |below, this_row|
  ms = below.each_cons(2).map(&:max) # converts the maximum scores of the row
                                     # below into the optimal choices for the
                                     # current row.
                                     # |[1,4,3,6,5]| ==> [4,4,6,6]

  ms.zip(this_row).map { |a, b| a + b } # adds the score for each number to the
                                        # score for its optimal choice
                                        # |[4,4,6,6], [2,3,1,2]| ==> [6,7,7,8]
end

puts max_score
