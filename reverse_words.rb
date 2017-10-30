require 'pry'
def reverse_words(str)
    start_i = 0
    start_j = str.length - 1

  while true do
    i = start_i
  #find first word
    first_word = ""

    while true do 
      if str[i] == " "
        i += 1
        break
      end
      first_word << str.slice!(i)
    end


  #find second word

    start_j -= first_word.length

    j = start_j
    second_word = ""
    while true do
      if str[j] == " "
        j += 1
        break
      end
        second_word.insert(0, str.slice!(j))
        j -= 1
    end

    if first_word == second_word
      str.insert(start_j, first_word)
      break str
    end

     

    str.insert(j, first_word)
    str.insert(i - 1, second_word)
    start_i = i + second_word.length
    start_j = j + (second_word.length - 2)
    if start_i >= start_j
      break str
    end

  end

end


message = 'find you will pain only go you recordings security the into if'

puts reverse_words(message)

puts "\n"

puts "should be 'Hello my name is'"
puts reverse_words("is name my hello")

puts "\n"

puts "should be 'Hello my name is RYan'"
puts reverse_words("Ryan is name my hello")

