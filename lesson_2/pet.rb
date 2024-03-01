# class Pet
#   attr_reader :name

#   def initialize(name)
#     @name = name.to_s
#   end

#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end

# name = 42
# fluffy = Pet.new(name)
# name += 1
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet
	def initialize(name, age, fur_color)
		super(name,age)
		@fur_color = fur_color
	end

	def to_s
		"My cat #{@name} is #{@age} years old and has #{@fur_color} fur."
	end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch