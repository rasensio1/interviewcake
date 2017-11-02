require 'digest'

class ShortU
  attr_accessor :stored

  def initialize
    @stored = {}
    @md5 = Digest::MD5.new
  end

  def add_url(destination)
    slug = @md5.hexdigest(destination)[0..5]
    @stored[slug] = destination

    {slug => destination}
  end
end


map = ShortU.new

puts map.add_url("google.com")
puts map.add_url("github.io/rasensio1")
puts map.add_url("turing.io/profiles/rasensio1/ruby")

puts map.stored
