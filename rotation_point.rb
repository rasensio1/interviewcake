require 'pry'
require 'random-word'

class Rotation
  VALUES = ("a".."z").zip(0..26).to_h 

  def initialize
    @list = []
    rand(1000).times { @list << RandomWord.adjs.next }
    @list.sort!
    first = @list.first

    @rand = rand(@list.length)
    @list.rotate!(@rand)
    @answer = @list.index(first)
    puts "answer should be #{@answer}"
  end

  def find_rotation
    len = @list.length

    floor_index = 0
    ceiling_index = len - 1
    until false

      guess_index = floor_index + (ceiling_index - floor_index) / 2

      if ceiling_index - floor_index == 1
        return ceiling_index
      elsif @list[guess_index] < @list[floor_index] # look left
        ceiling_index = guess_index
      elsif @list[guess_index] > @list[floor_index] # look right
        floor_index = guess_index
      end
      
    end
  end

end

rot = Rotation.new
puts rot.find_rotation
