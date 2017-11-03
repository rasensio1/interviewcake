# Given a list of integers, find the highest product you can get from three of the integers.

#   The input list_of_ints will always have at least three integers.


#3 pos   OR 2neg 1Pos

def highest_p_3(list)
  highest = list.first(3).reduce(:*)

  first_pos = list.first(2).max
  sec_pos = list.first(2).min
  first_neg = list.first(2).min

  i = 2
  while i < list.length do
    c = list[i]
    highest = [highest, c*first_pos*sec_pos , first_neg*first_pos*c].max

    if c >= first_pos
      sec_pos = first_pos
      first_pos = c
    end

    if c <= first_neg
      first_neg = c
    end

    i += 1
  end

  highest
end

list = [10, 9, -11, 10]
puts "should be 900"
puts "output: #{highest_p_3(list)}"

list = [-10, 9, 5, -2, 9, -10]
puts "should be 900"
puts "output: #{highest_p_3(list)}"

