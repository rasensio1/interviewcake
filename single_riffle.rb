
def single_riffle?(shuffled)
    stack_1_at = nil
    stack_2_at = nil
    i = 0

  while i < shuffled.length
    num = shuffled[i]

    if !stack_1_at
      stack_1_at = num
    elsif num == (stack_1_at + 1)
      stack_1_at += 1
    elsif !stack_2_at
      stack_2_at = num
    elsif num == (stack_2_at + 1)
      stack_2_at += 1
    else
      return false
    end
    i += 1
  end
  true
end

test = [1, 2, 3, 4, 5, 6, 7, 8, 20, 21, 22, 23, 24, 9, 10, 25, 26, 27, 11, 12, 13]
puts "should be true"
puts single_riffle?(test)

test = []
puts single_riffle?(test)

test = [1, 2, 3, 4, 5, 6, 7, 8, 20, 21, 22, 23, 24, 9, 10, 25, 26, 27, 11, 12, 13]
puts single_riffle?(test)


test = [1, 2, 3, 5, 6, 7, 8, 20, 21, 22, 23, 24, 9, 10, 25, 26, 27, 11, 12, 13]
puts "\n"
puts "should be false"
puts single_riffle?(test)

test = [1, 2, 3, 4, 5, 6, 7, 8, 20, 21, 22, 23, 9, 10, 25, 26, 27, 11, 12, 13]
puts single_riffle?(test)

test = [1, 2, 3, 4, 5, 6, 7, 8, 20, 21, 22, 23, 24, 9, 10, 25, 26, 27, 11, 12, 13, 30]
puts single_riffle?(test)
