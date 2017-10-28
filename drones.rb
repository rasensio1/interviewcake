class MissingD
  def initialize(ids)
    @ids = ids
    #[33, 23, 45, 67, 89, 12, 23, 67, 45, 89, 12]
  end

  def missing_id
    drones_out = 0
    @ids.each do |id|
      drones_out ^= id
    end
    drones_out
  end
end

ids = ((1..100).to_a * 2).shuffle
id = ids.pop

missing = MissingD.new(ids)
puts "should be #{id}"
puts missing.missing_id

ids = ((1..100).to_a * 2).shuffle
id = ids.pop
missing = MissingD.new(ids)
puts "should be #{id}"
puts missing.missing_id

ids = ((1..100).to_a * 2).shuffle
id = ids.pop
missing = MissingD.new(ids)
puts "should be #{id}"
puts missing.missing_id
