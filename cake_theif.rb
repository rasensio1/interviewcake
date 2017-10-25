cake_arrays = [[7, 160], [3, 90], [2, 15], [0, 10]]
capacity = 20

def max_duffel_bag_value(cake_arrays, capacity)
  max_values = Hash.new(0)
  cake_arrays.reject! { |w, v| w.zero?}


  for cap in (1..capacity) do
    cake_arrays.each do |w, v|
      if w <= capacity
        if w <= cap
          r = cap - w
          max_values[cap] = [v + max_values[r], max_values[cap]].max
        end
      end
    end

  end
  puts max_values[capacity]
end

puts max_duffel_bag_value(cake_arrays, capacity)
puts max_duffel_bag_value(cake_arrays, 0)
