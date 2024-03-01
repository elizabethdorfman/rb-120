module RoadTrip
	def trip_break
		"30 min break"
	end
end

class Vehicle
	attr_accessor :year, :model, :color
	@@num_vehicles = 0

	def self.number_of_vehicles
		puts "This program has creaed #{@@num_vehicles} vehicles"
	end
	attr_accessor :year, :model, :color
	def initialize(year, model, color)
		@year = year
		@model = model
		@color = color
		@current_speed = 0
	end
	def speed_up(number)
		@current_speed += number
		puts "You push the gas and accelerate #{number} mph."
	end

	def brake(number)
		@current_speed -= number
		puts "You push the brake and decelerate #{number} mph."
	end

	def current_speed
		puts "You are now going #{@current_speed} mph."
	end

	def shut_down
		@current_speed = 0
		puts "Let's park this bad boy!"
	end

	def self.gas_mileage (gallons, miles)
		puts "#{miles/gallons} miles per gallon of gas"
	end

	def to_s
		puts "This is a #{color}, #{model} car that was made in #{year}."
	end
	def get_age
		puts "#{age} years old."
	end
	private
	def age
		Time.now.year- @year
	end
end

class MyCar < Vehicle
		NUMBER_OF_DOORS = 4
	include RoadTrip
	def to_s
    "My car is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class MyTruck < Vehicle
	NUMBER_OF_DOORS = 2
	def to_s
    "My truck  is a #{self.color}, #{self.year}, #{self.model}!"
  end
end

class Student
	def initialize(name, grade)
		@name = name
		@grade = grade
	end
	def better_grade_than(other_student)
		grade < other_student.grade
	end
	protected
	def grade
		@grade
	end
end


class Animal
  def initialize(name)
    @name = name
  end

  def speak
    puts sound
  end

  def sound
    "#{@name} says "
  end
end

class Cow < Animal
  def sound
    super + "moooooooooooo!"
  end
end

class MeMyselfAndI
  self

  def self.me
    self
  end

  def myself
    self
  end
end

puts MeMyselfAndI.me
i = MeMyselfAndI.new
puts i.myself
