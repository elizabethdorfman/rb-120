class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end
end

class BullDog < Dog
	def swim
		puts "cant swim"
	end
end

teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim