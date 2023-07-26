require_relative 'person'
# Represents a student with a name, age, parent permission status, and classroom.
# Inherits from Person class.
class Student < Person
  attr_accessor :classroom

  def initialize(name = 'Unknown', age = 0, parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = nil
    self.classroom = classroom if classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end

  def enroll_in_classroom(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end
end
