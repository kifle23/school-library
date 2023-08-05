# Represents a teacher with a name, age, and specialization.
# Inherits from Person class.
class Teacher < Person
  attr_reader :specialization

  def initialize(name, age, specialization, **defaults)
    super(name, age, **defaults)
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
