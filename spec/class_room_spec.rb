require_relative '../lib/class_room'
require_relative '../lib/student'

describe Classroom do
  describe '#initialize' do
    it 'creates a classroom with a label' do
      classroom = Classroom.new('1A')
      expect(classroom.label).to eq('1A')
      expect(classroom.students).to eq([])
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom and sets the student\'s classroom' do
      classroom = Classroom.new('2B')
      student = Student.new('John', 10)
      classroom.add_student(student)
      expect(classroom.students).to eq([student])
      expect(student.classroom).to eq(classroom)
    end
  end
end
