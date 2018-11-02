require 'pry'
# Finish the implementation of the Car class so it has the functionality described below

class Car
    attr_reader :make, :model

    @@all = []

    def initialize(args)
        @make = args[:make]
        @model = args[:model]
        @@all << self
    end

    def self.all
        @@all 
    end

    def drive
        "VROOOOOOOOOOOOM!"
    end


end

# volvo_lightning = Car.new("Volvo", "Lightning")
# yugo = Car.new("Zastava", "Yugo")
# lada = Car.new("AvtoVAZ", "Lada")

# volvo_lightning.make
# #=> "Volvo"
# volvo_lightning.model
# #=> "Lightning"

# lada.drive
# # => "VROOOOOOOOOOOOM!"

Car.all
#=> [#<Car:0x00007fae28930f20>, #<Car:0x00007fae28923370>, #<Car:0x00007fae2891ae78>]

#BONUS:

volvo_lightning = Car.new(make: "Volvo", model: "Lightning")

volvo_lightning.make
#=> "Volvo"
volvo_lightning.model
#=> "Lightning"

binding.pry
"1"