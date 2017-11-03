# Write a function get_products_of_all_ints_except_at_index() that takes a list of integers and returns a list of the products. 
#
# No division!

ints = [1, 7, 3, 4]
len = ints.size
# -> [84, 12, 28, 21]

product_before_me = 1
product_after_me = 1
before_list = []

i=0
while i < len
  before_list << product_before_me
  product_before_me*= ints[i]
  i+=1
end

puts "before list: #{ before_list}"

i -= 1
while i >= 0
  before_list[i] = before_list[i] * product_after_me
  product_after_me*= ints[i]
  i-=1
end

puts "done list #{before_list}"


