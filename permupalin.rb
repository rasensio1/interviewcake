require 'set'
class PermuPalin

  def self.check(str)
    lets = Set.new

    i = 0
    while i < str.length do
      if lets.include?(str[i])
        lets.delete(str[i])
      else
        lets.add(str[i])
      end
      i += 1
    end
    lets.size <= 1
  end
end

puts "should be true"
puts PermuPalin.check("civic")
puts PermuPalin.check("ivicc")

puts "\nshould be false"
puts PermuPalin.check("civil")
puts PermuPalin.check("livci")
