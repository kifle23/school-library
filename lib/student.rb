require_relative 'person'
# Represents a student with a name, age, parent permission status, and classroom.
# Inherits from Person class.
require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(name = 'Unknown', age = 0, parent_permission: true, classroom: nil)
    super(name, age, parent_permission: parent_permission)
    @classroom = nil
    self.classroom = classroom if classroom
  end

  def classroom=(new_classroom)
    @classroom = new_classroom
  end

  def play_hooky
    '¯\\(ツ)/¯'
  end
end