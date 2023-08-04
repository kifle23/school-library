require_relative 'nameable'
require_relative '../decorators/capitalize_decorator'
require_relative '../decorators/trimmer_decorator'
require_relative 'book'
require_relative 'rental'

class Person < Nameable
  attr_reader :parent_permission, :id
  attr_accessor :name, :age, :rentals

  def initialize(age, name: 'Unknown', parent_permission: true)
    super()
    @id = rand(1000..10_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def of_age?
    @age >= 18
  end

  def to_h
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission
    }
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end
end
