class TempTracker

  def initialize
    @empty = true
    @count = 0
    @counts = Hash.new(0)
  end

  def insert(temp)
    if @empty
      @max = @min = temp
      @mean = temp.to_f
      @count += 1
      @empty = false
      @mode = temp
      @max_occur = 1
    else
      @max = [temp, @max].max
      @min = [temp, @min].min
      @mean = ((@mean * @count) + temp) / (@count +1)
      @count += 1
      @counts[temp] += 1
      if @counts[temp] > @max_occur
        @mode = temp
        @max_occur = @counts[temp]
      end

    end
  end

  def get_max
    @max
  end
  
  def get_min
    @min
  end

  def get_mean
    @mean
  end

  def get_mode
    @mode
  end

end

temp = TempTracker.new
temp.insert(100)
temp.insert(27)
temp.insert(80)
temp.insert(27)
puts temp.get_mode
