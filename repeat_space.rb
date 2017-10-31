require 'pry'
def find_duplicate(coll)
  n = coll.length - 1
  ceiling = n
  floor = 1
  
  upper_range = ceiling/2
  lower_range = 1

  while true do
    in_range_count = 0

    coll.each do |e| 
      if upper_range >= e && lower_range <= e
        in_range_count += 1
      end
    end

    if upper_range == lower_range
      if in_range_count > 1
        return floor
      else
        return ceiling
      end
    end


    if in_range_count > (upper_range - lower_range + 1)
      ceiling = upper_range
      floor = floor
    else
      ceiling = ceiling
      floor = upper_range
    end

      upper_range = floor + (ceiling - floor)/2
      lower_range = floor
  end

  upper_range
end


puts "should be 4"
puts find_duplicate([1, 2, 3, 4, 5, 9, 8, 7, 6, 4])

puts "should be 2"
puts find_duplicate([1, 2, 3, 4, 5, 9, 8, 7, 6, 10, 11, 14, 13, 12, 2])
