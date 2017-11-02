require 'pry'
def merge_sorted(coll1, coll2)
  sorted = []

  until coll1.empty? && coll2.empty? do

    if coll1.empty?
      until coll2.empty? do
        sorted << coll2.shift
      end
    elsif coll2.empty?
      until coll1.empty? do
        sorted << coll1.shift
      end
    elsif coll1.first < coll2.first
      sorted << coll1.shift
    else
      sorted << coll2.shift
    end

  end
  sorted
end

puts "should be [1, 2, 3, 4, 5]"
puts merge_sorted([1, 4, 5], [2, 3])


def merge_sorted_n(collcs)
  sorted = []

  while !collcs.empty? do
    col_with_min = collcs.map.with_index do |e, i|
      [e.first, i]
    end.min_by { |e| e.first}.last

    sorted << collcs[col_with_min].shift
    collcs.reject!(&:empty?)
  end
  sorted

end


puts "\n"
puts "should be [1, 2, 3, 4, 5, 6, 7, 8, 9]"
puts merge_sorted_n([[1, 4, 5], [2, 3, 7, 9], [6, 8]])
