class JSValid
  def self.check(string)
    i = 0
    closures = []
    matches = {")" => "(", "}" => "{", "]" => "[" }

    while i < string.length do 
      if ["(", "{", "["].include?(string[i])
        closures << string[i]
      elsif [")", "}", "]"].include?(string[i])
        if closures.last == matches[string[i]]
          closures.pop
        else
          return false
        end
      end
      i += 1
    end
    closures.empty?
  end
end

puts "should be true"
puts JSValid.check("(())")

puts "\n"
puts "should be true"
puts JSValid.check("(hel(lkdj{}f))")

puts "\n"
puts "should be false"
puts JSValid.check("(()")

puts "\n"
puts "should be false"
puts JSValid.check(")(){}{{}}")
