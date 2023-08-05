require_relative 'person'
# Represents a student with a name, age, parent permission status, and classroom.
# Inherits from Person class.
class Student < Person
  attr_accessor :classroom

  def initialize(name, age, classroom, **defaults)
    defaults[:parent_permission] = true if defaults[:parent_permission].nil?
    super(name, age, **defaults)
    @classroom = nil
    self.classroom = classroom if classroom
  end

  def to_h
    {
      type: self.class.name,
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      classroom: @classroom
    }
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def enroll_in_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end
end
