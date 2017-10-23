# Given a list of integers, find the highest product you can get from three of the integers.

#   The input list_of_ints will always have at least three integers.

list = [1, 5, 7, 3, 56, 789, 25, 71]
list = [-10, 9, 5, -2, 9, -10]
list = [10, 9, -11, 10]

#3 pos   OR 2neg 1Pos

highest = list.first(3).reduce(:*)

running_pos =  list.first(2).reduce(:*)
  # first_pos * previous high pos
running_neg = list.first(2).reduce(:*)
   # first_pos * first_neg

first_pos = list.first(2).max
first_neg = list.first(2).min


len = list.length

i = 2
while i < len do
  curr = list[i]
  highest = [highest, running_pos * curr, running_neg * curr].max

  if curr >= first_pos
    running_pos = curr * first_pos
    first_pos = curr
  end

  if curr <= first_neg
    running_neg = first_pos * curr
    first_neg = curr
  end

  i += 1
end

highest

puts "output: #{highest}"
