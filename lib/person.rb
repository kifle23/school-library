# frozen_string_literal: true

# Represents a person with a name, age, and parent permission status.
class Person
  attr_reader :id
  attr_accessor :name, :age

  def initialize(name = 'Unknown', age = 0, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private :of_age?
end
