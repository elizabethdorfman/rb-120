class Animal
  def initialize
  end
end

class Bear < Animal
  def initialize(color)
    super
    @color = color
  end
end

bear = Bear.new("black")
p bear       # => #<Bear:0x007fb40b1e6718 @color="black">