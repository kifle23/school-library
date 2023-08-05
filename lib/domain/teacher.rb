# Represents a teacher with a name, age, and specialization.
# Inherits from Person class.
class Teacher < Person
  attr_reader :specialization

  def initialize(name = 'Unknown', age = 0, specialization = 'Unknown')
    super(name, age)
    @specialization = specialization
  end

  def to_h
    {
      type: self.class.name,
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization
    }
  end

  def can_use_services?
    true
  end
end
