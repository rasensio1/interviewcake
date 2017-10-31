def shuffle(coll)
  i = 0
  rand_size = coll.length
  while i < (coll.length - 1) do
    rand = rand(rand_size)
    coll[i], coll[i + rand] = coll[i + rand], coll[i]
    i += 1
    rand_size -= 1
  end
  coll
end

puts shuffle([1, 2, 3, 4, 5, 6, 7])
puts "\n"
puts shuffle([1, 2, 3, 4, 5, 6, 7, 8])
