def which_twice(n, ary)
  sum = (n**2 + n)/2

  ary.reduce(:+) - sum
end


puts "should be 8"

puts which_twice(12, [1, 2, 3, 4, 5, 6, 7, 8, 8, 9, 10, 11, 12])
