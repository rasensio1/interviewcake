require 'pry'
class ParenFinder
  def self.find_matching(string, idx)
    parens = 1

    while parens > 0 do
      case string[idx + 1]
      when "("
        parens += 1
      when ")"
        parens -= 1
      end
      idx += 1
    end
    idx
  end
end


puts "should be 3"
puts ParenFinder.find_matching("(())", 0)

puts "\n"
puts "should be 79"
puts ParenFinder.find_matching("Sometimes (when I nest them (my parentheticals) too much (like this (and this))) they get confusing.", 10)

puts "\n"
puts "should be 10"
puts ParenFinder.find_matching("(123456789)", 0)

puts "\n"
puts "should be 7"
puts ParenFinder.find_matching("((()123)235235)(sdf)", 1)
