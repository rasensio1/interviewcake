def rand5
  (1..5).to_a.sample
end

def rand7
  while true do
    roll1 = rand5
    roll2 = rand5

    sum = (roll1 - 1) * 5 + roll2 #each num has one possiblity 1 -> 25

    if sum > 21
      next
    end

    return (sum % 7) + 1
  end
end


puts rand7
