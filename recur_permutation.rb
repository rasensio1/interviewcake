require 'set'
#Write a recursive function for generation all permutations of an input string.
#Return them as a set.
#
def perm(rest, string="")
  return Set.new([string]) if rest.empty?
  res = rest.chars.flat_map do |let|
    perm(rest.delete(let), string.dup << let)
  end
  res.reduce(Set.new) { |coll, e| coll.merge(e)}
end

puts perm("cat").to_a

puts perm("hello").to_a
