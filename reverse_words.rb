require 'pry'
def reverse_words(str)
    i = 0
    j = str.length - 1

  while true do
    first_word = ""
    while true do 
      if str[i] == " "
        i += 1
        break
      end
      first_word << str.slice!(i)
    end

    j -= first_word.length
    second_word = ""
    while true do
      if str[j] == " "
        j += 1
        break
      end
        second_word.insert(0, str.slice!(j))
        j -= 1
    end

    str.insert(j, first_word)
    str.insert(i - 1, second_word)
    i = i + second_word.length
    j = j + (second_word.length - 2)

    if i >= j
      break str
    end

  end
end

def reverse_words2(message)
  reverse_message(message, 0, message.length - 1)

  i = 0
  start_idx = 0
  until i == message.length do
    if message[i + 1] == " " || i == (message.length - 1)
      reverse_message(message, start_idx, i)
      start_idx = i + 2
    end
    i += 1
  end
  message
end

def reverse_message(message, i, j)
  until i >= j do
    begin
    message[i], message[j] = message[j], message[i]
    rescue
      binding.pry
    end
    i += 1
    j -= 1
  end
  message
end


puts "\n"

puts "should be 'Hello my name is'"
puts reverse_words("is name my hello")
puts reverse_words2("is name my hello")

puts "\n"

puts "should be 'Hello my name is RYan'"
puts reverse_words("Ryan is name my hello")
puts reverse_words2("Ryan is name my hello")

puts "\n"

puts "should be 'ok yeahyeahyeahyeah'"
puts reverse_words("yeahyeahyeahyeah ok")
puts reverse_words2("yeahyeahyeahyeah ok")

