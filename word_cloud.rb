#Not using regexp-based solutions, like "split" or "gsub", etc.

def word_cloud(string)
  string.downcase!
  count = Hash.new(0)

  until string.empty? do
    word, string  = find_word(string)
    count[word] += 1
  end
  count
end

def find_word(string)
  res = ""
  while true do
    char = string.slice!(0).to_s
    if [char == " ", #end of word conditions
        char == "", 
        (char + string[0..1] == "...")].any?
      clean_word(res, 0) #removes trailing punctuation e.g. Great!!!!, ...ok
      clean_word(res, -1)
      return [res, string]
    else
      res << char
    end
  end
end

def clean_word(res, idx)
  until ("a".."z").include?(res[idx])
    res.slice!(idx)
  end
end

text =   "After beating the eggs, Dana read the next step: Add milk and eggs, then add flour and sugar."

puts word_cloud(text)

puts "\n"
text = "We came, we saw, we conquered...then we ate Bill's (Mille-Feuille) cake."
puts word_cloud(text)

puts "\n"
text = "The bill came to five dollars!!!"
puts word_cloud(text)
