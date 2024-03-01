class FixedArray
	def initialize(num)
		@num = num
		@array = Array.new(num)
	end
	def []=(index, value)
		if index > @num || -index > @num
			raise IndexError
		end
		@array[index] = value
	end
	def [](index)
		if index > @num || -index > @num
			raise IndexError
		end
		@array[index]
	end
	def to_a
		@array
	end
	def to_s
		@array.to_s
	end
end
fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
hello = fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
puts "test #{hello}"
puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end