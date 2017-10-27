require 'set'
class MovieTime

  def self.exactly_two?(flight_length, movie_lengths)
    flight = flight_length
    movies = movie_lengths
    lengths = Set.new

    while !movies.empty?
      movie = movies.pop

      if lengths.include?(movie)
        return true
      else
        lengths << (flight - movie)
      end

    end
    return false

  end
end

puts "should be true"
puts MovieTime.exactly_two?(100, [25, 70, 23, 100, 32, 30])
puts MovieTime.exactly_two?(100, [25, 70, 23, 100, 32, 3, 97])

puts "should be false"
puts MovieTime.exactly_two?(100, [25, 70, 23, 100, 32])
puts MovieTime.exactly_two?(100, [100, 50])
puts MovieTime.exactly_two?(100, [99, 98, 97, 10])
