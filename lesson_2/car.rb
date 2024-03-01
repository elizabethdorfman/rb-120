# class Car
#   attr_accessor :mileage

#   def initialize
#     @mileage = 0
#   end

#   def increment_mileage(miles)
#     total = mileage + miles
#     self.mileage = total
#   end

#   def print_mileage
#     puts mileage
#   end
# end

# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

class Vehicle
	attr_reader :make, :model

	def initialize(make, model)
    @make = make
    @model = model
  end

	def to_s
    "#{make} #{model}"
  end

end

class Car < Vehicle

  def wheels
    4
  end
end

class Motorcycle

  def wheels
    2
  end
end

class Truck
  attr_reader :payload

  def initialize(make, model, payload)
   super(make,model)
    @payload = payload
  end

  def wheels
    6
  end
end