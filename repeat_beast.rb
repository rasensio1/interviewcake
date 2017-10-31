require 'pry'
def dup_linked(coll)
  len = coll.length

  #find length of cycle
  curr = coll[-1]
  len.times do
    curr = coll[curr - 1]
  end

  #curr @ end of list
  marker = curr
  cycle_len = 0
  while true do
    cycle_len += 1
    curr = coll[curr - 1]
    break if curr == marker
  end

  forward = coll[-1]
  cycle_len.times do
    forward = coll[forward - 1]
  end

  back = coll[-1]
  until forward == back do
    forward = coll[forward - 1]
    back = coll[back - 1]
  end

  return forward
end

puts "should be 1"
puts dup_linked([1, 3, 2, 4, 6, 1, 5, 7, 8, 10, 9])

puts "should be 8"
puts dup_linked([1, 3, 2, 4, 6, 5, 7, 8, 8, 10, 9])

puts "should be 9"
puts dup_linked([1, 3, 2, 4, 6, 5, 7, 8, 10, 9, 9])
