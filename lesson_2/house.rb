
# class House
# 	include Comparable
#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

# 	def <=>(other_home)
# 		@price <=> other_home.price
# 	end
# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

class Transform
	attr_reader  :data, :uppercase
	def initialize(data)
		@data = data
		@uppercase = data.upcase
	end
	def self.lowercase(data)
		data.downcase
	end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')