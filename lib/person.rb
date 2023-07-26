require_relative '../decorators/nameable'

# Represents a person with a name, age, and parent permission status.
class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age, :parent_permission, :rentals

  def initialize(name = 'Unknown', age = 0, parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def correct_name
    @name
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def to_s
    "Person (id: #{@id}, name: #{@name}, age: #{@age}, parent_permission: #{@parent_permission})"
  end

  def add_rental(person, date)
    rental = Rental.new(date, self, person)
    @rentals << rental
    person.add_rental(rental)
  end

  private :of_age?
end
