# The Classroom class represents a classroom that contains a group of students.
class Classroom
  attr_reader :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def to_h
    {
      label: @label,
      students: @students.map(&:to_h)
    }
  end

  def add_student(student)
    student.classroom&.remove_student(student)
    student.classroom = self
    @students << student
  end

  def remove_student(student)
    return unless student.classroom == self

    student.classroom = nil
    @students.delete(student)
  end
end
