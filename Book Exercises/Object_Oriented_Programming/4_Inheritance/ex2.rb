class Vehicle
  @@object_number = 0
  
  def initialize
    @@object_number += 1
  end
  
  def self.gas_mileage(gallons, miles)
    puts "#{miles / gallons} miles per gallon of gas"
  end
  
  def self.display_object_number
    @@object_number
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  NUMBER_OF_DOORS = 2
end

Vehicle.gas_mileage(12, 123)

kia = MyCar.new
jeep = MyTruck.new
nissan = MyCar.new

puts Vehicle.display_object_number

