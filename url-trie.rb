require 'pry'
class Trie
  
  def initialize
    @data = Hash.new
  end

  def insert(word)
    split = word.chars
    split.push("fin")
    place = @data

    until split.empty?

      letter = split.shift
      
      if !place.key?(letter)
        place[letter] = {}
        place = place[letter]
      else
        place = place[letter]
      end
    end
  end

  def includes?(word)
    split = word.chars
    split.push("fin")
    place = @data

    until split.empty?
      letter = split.shift
      
      if place.key?(letter)
        place = place[letter]
      else
        return false
      end
    end
    true
  end

  def showme
    @data
  end

end

tree = Trie.new
tree.insert("hello")
tree.insert("help")
puts "should be true"
puts tree.includes?("help")
puts tree.includes?("hello")

puts "should be false"
puts tree.includes?("hell")
puts tree.includes?("cat")
