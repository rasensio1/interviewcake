def reverse_string(str)
  len = str.length

  i = 0
  until i == len/2 do
    high_idx = len - 1 - i 
    first = str[i]
    str[i] = str[high_idx]
    str[high_idx] = first
    i += 1
  end
  str
end

puts "should be tac"
puts reverse_string("cat")


puts "should be olleh"
puts reverse_string("hello")


puts "should be poiuytrewq"
puts reverse_string("qwertyuiop")


