# find duplicate files in the FS
#
require 'digest'

filenames = IO.popen('find ~/ryan/prog -not -path "*/.git/*" -type f')

counter = Hash.new{ |h, k| h[k] = [] }
filenames.readlines.each do |line|

  file = File.open(line.strip)
  string = file.read
  hash = Digest::MD5.hexdigest(string).to_i(16) % 100000
  counter[hash] << line.strip
  file.close
end

res = counter.select { |h, coll| coll.size > 1 }
  .reduce([]) do |tuples, tuple|
    tuple[1].sort_by! {|file| File.new(file).mtime}.reverse!
    tuples << tuple[1]
end

puts res

