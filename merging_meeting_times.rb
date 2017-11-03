require 'pp'
require 'pry'
# Write a function merge_ranges() that takes a list of meeting time
# ranges and returns a list of condensed ranges. 
#

times = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]

# go through list, merging any elements that share boundaries
# collecting elements that don't share boundaries
# also merging with any collected elements
# checking inter collected elemetns for merging

def merge_times(times)
  len = times.length
  sorted = times.sort_by { |f, s| f }

  curr = [sorted.first]

  i=1
  while i < len do
    if curr.last[1] >= sorted[i][0]
      max_last = [sorted[i][1], curr.last[1]].max
      curr[curr.length - 1] = [curr.last[0], max_last]
    else
      curr << sorted[i]
    end

    i += 1
  end
  curr
end

def merge_times_inplace(times)
  times.sort_by! { |f, s| f }

  i = 0
  while i < times.length do
    while times[i + 1] && times[i][1] >= times[i + 1][0] do
      times[i][1] = [times[i][1], times[i + 1][1]].max
      times.slice!(i + 1)
    end
    i += 1
  end
  times
end

pp merge_times(times)

pp merge_times_inplace(times)
