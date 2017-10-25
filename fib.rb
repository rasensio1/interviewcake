



def fib(n)

  prev_prev = 0
  prev = 1
  curr = 1

  (n-1).times do
    tmp = curr
    curr += prev
    prev = tmp
  end

  curr
end


puts fib(10)
