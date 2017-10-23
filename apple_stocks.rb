
prices = [2, 5, 3, 7, 8, 1, 4, 2, 5]
prices = [8, 5, 3, 0]
len = prices.length

best_sell = prices[1] - prices[0]
lowest_seen = prices.first

i = 0
while i < len do
  if prices[i] - lowest_seen > best_sell && i != 0
    best_sell = prices[i] - lowest_seen
  end

  if prices[i] < lowest_seen
    lowest_seen = prices[i]
  end
  i+= 1
end

puts best_sell

#find difference

