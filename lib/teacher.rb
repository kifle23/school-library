require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(name = "Unknown", age = 0, specialization = "Unknown")
    super(name, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end