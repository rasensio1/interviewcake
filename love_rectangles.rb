require 'pry'
sample_1 = {      
  'left_x' => 1, #(1..11)
  'bottom_y' => 5, #(5..9)

  'width' => 10,
  'height' => 4
}

sample_2 = {
  'left_x' => 7,#(7..9)
  'bottom_y' => 8, #(8..11)

  'width' => 2,
  'height' => 3
}

sample_3 = {
  'left_x' => 0,
  'bottom_y' => 0,

  'width' => 2,
  'height' => 2
}

sample_4 = {
  'left_x' => 0,
  'bottom_y' => 0,

  'width' => 1,
  'height' => 1
}

sample_5 = {
  'left_x' => 0,
  'bottom_y' => 0,

  'width' => 1,
  'height' => 1
}
sample_6 = {
  'left_x' => 1,
  'bottom_y' => 0,

  'width' => 1,
  'height' => 2
}


# sort x-ranges
# ranges intersect?
# if yes
#   (second start -> either end)

def love_rectangle(rect_1, rect_2)
  ranges_1 = make_range(rect_1)
  ranges_2 = make_range(rect_2)

  match_x = matching_range(ranges_1[:x], ranges_2[:x])
  match_y = matching_range(ranges_1[:y], ranges_2[:y])

  if [match_x.empty?, match_y.empty?].any?
    "No match!"
  else
    make_output(match_x, match_y)
  end
end

def make_output(match_x, match_y)
  {
    'left_x' => match_x.first,
    'bottom_y' => match_y.first,

    'width' => (match_x[1] - match_x[0]),
    'height' => (match_y[1] - match_y[0])
  }
end

def make_range(rect)
  {x: [rect['left_x'], (rect['left_x'] + rect['width'])],
   y: [rect['bottom_y'], (rect['bottom_y'] + rect['height'])]}
end

def matching_range(range1, range2)
  sorted = [range1, range2].sort_by { |b, e| b }
  if sorted.first[1] > sorted.last[0]
    [sorted.last[0], [sorted.first[1], sorted.last[1]].min]
  else
    []
  end
end

puts love_rectangle(sample_1, sample_2)
puts love_rectangle(sample_3, sample_4)
puts love_rectangle(sample_5, sample_6)
