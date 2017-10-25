require 'pry'
# Write a function that, given:

#       an amount of money
#       a list of coin denominations

#  computes the number of ways to make the amount of money with
#  coins of the available denominations. 
#

def combos_filter (amount, denoms)
  filtered = denoms.sort!.reverse!

  how_many_combos(amount, filtered)
end

@storage = {}

def how_many_combos(amount, denoms)
  return @storage[[amount, denoms]] if @storage[[amount, denoms]]
  
  combos = 0
  return 0 if denoms.empty? || amount.zero?
  denoms.each do |denom|
    copy = amount.dup
    while copy >= denom do
      copy -= denom #copy 1 amount 2
      result = how_many_combos(copy, less_than(denoms, denom))
      @storage[[copy, less_than(denoms, denom)]] = result
      combos += result
      if copy == 0
        combos += 1
      end
    end
  end
  combos
end

def less_than(denoms, denom)
  denoms.select{ |e| e < denom}
end

amount = 100
denoms = [6, 23, 2, 3, 1].sort!.reverse!

puts "recursive: #{combos_filter(amount, denoms)}"


def change_possibilities_bottom_up(amount, denominations)
  ways_of_doing_n_cents = [0] * (amount + 1)
  ways_of_doing_n_cents[0] = 1

  for coin in denominations do
    for higher_amount in (coin..amount) do
      ways_of_doing_n_cents[higher_amount] += ways_of_doing_n_cents[higher_amount - coin]
      end
    end
  end

  return ways_of_doing_n_cents[amount]

end

puts "bottom-up: #{change_possibilities_bottom_up(amount, denoms)}"

















