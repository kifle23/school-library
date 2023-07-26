# The Rental class represents a rental with a date.
# It provides a getter and setter for the date.
class Rental
    attr_accessor :date
  
    def initialize(date)
      @date = date
    end
end