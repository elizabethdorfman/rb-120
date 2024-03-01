
# # # class Person
# # # 	attr_accessor :first_name, :last_name

# # # 	def initialize(name)
# # # 		parse_full_name(name)
# # # 	end

# # # 	def name
# # # 		@first_name + " " + @last_name
# # # 	end

# # # 	def name=(full_name)
# # # 		parse_full_name(full_name)
# # # 	end

# # # 	private

# # # 	def parse_full_name(full_name)
# # # 		parts = full_name.split
# # #     @first_name = parts.first
# # #     @last_name = parts.size > 1 ? parts.last : ''
# # # 	end
# # # end

# # # # bob = Person.new('Robert Smith')
# # # # rob = Person.new('Robert Smith')
# # # # puts bob.name == rob.name



# # # class Person
# # #   attr_writer :secret

# # # 	def compare_secret(person2)
# # # 		self.secret == person2.secret
# # # 	end

# # #   protected

# # #   attr_reader :secret
# # # end

# # # person1 = Person.new
# # # person1.secret = 'Shh.. this is a secret!'

# # # person2 = Person.new
# # # person2.secret = 'Shh.. this is a different secret!'

# # # puts person1.compare_secret(person2)

# # class Person
# # 	def name=(name)
# # 		@first_name = name.split.first
# # 		@last_name = name.split.last
# # 	end
# # 	def name
# # 		@first_name + @last_name
# # 	end
# # end

# # person1 = Person.new
# # person1.name = 'John Doe'
# # puts person1.name

# class Person
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end

# 	def first_name=(first_name)
# 		@first_name = first_name.capitalize
# 	end

# 	def last_name=(last_name)
# 		@last_name = last_name.capitalize
# 	end

#   def to_s
#     "#{@first_name} #{@last_name}"
#   end
# end

# person = Person.new('john', 'doe')
# puts person

# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person
module Walkable
	def walk
		puts "#{self} #{gait} forward"
	end
end

class Person
	include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end

	def to_s
		name
	end
end

class Cat
	include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end

	def to_s
		name
	end
end

class Cheetah
	include Walkable

  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end

	def to_s
		name
	end
end

class Noble
	attr_reader :name, :title
	def initialize (name, title)
		@name = name
		@title = title
	end
	def to_s
		"#{title} #{name}"
	end
end

mike = Person.new("Mike")
mike.walk
# => "Mike strolls forward"

kitty = Cat.new("Kitty")
kitty.walk
# => "Kitty saunters forward"

flash = Cheetah.new("Flash")
flash.walk
# => "Flash runs forward"