require_relative '../lib/domain/class_room'
require_relative '../lib/domain/student'

describe Classroom do
  let(:classroom) { Classroom.new('Math Class') }
  let(:student1) { Student.new('John', 15, classroom) }
  let(:student2) { Student.new('Jane', 16, classroom) }

  describe '#initialize' do
    it 'sets the correct label' do
      expect(classroom.label).to eq('Math Class')
    end

    it 'initializes students as an empty array' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the classroom' do
      expected_hash = {
        label: 'Math Class',
        students: []
      }
      expect(classroom.to_h).to eq(expected_hash)
    end

    it 'includes students in the hash' do
      classroom.add_student(student1)
      expected_hash = {
        label: 'Math Class',
        students: [student1.to_h]
      }
      expect(classroom.to_h).to eq(expected_hash)
    end
  end

  describe '#add_student' do
    it 'adds the student to the classroom' do
      classroom.add_student(student1)
      expect(classroom.students).to include(student1)
    end

    it 'updates the student\'s classroom' do
      classroom.add_student(student2)
      expect(student2.classroom).to eq(classroom)
    end

    it 'removes the student from their previous classroom' do
      old_classroom = Classroom.new('Science Class')
      student1.classroom = old_classroom

      classroom.add_student(student1)

      expect(old_classroom.students).not_to include(student1)
      expect(student1.classroom).to eq(classroom)
    end
  end

  describe '#remove_student' do
    it 'removes the student from the classroom' do
      classroom.add_student(student1)
      classroom.remove_student(student1)
      expect(classroom.students).not_to include(student1)
    end

    it 'updates the student\'s classroom to nil' do
      classroom.add_student(student1)
      classroom.remove_student(student1)
      expect(student1.classroom).to be_nil
    end

    it 'does nothing if the student is not in the classroom' do
      classroom.remove_student(student2)
      expect(classroom.students).not_to include(student2)
    end
  end
end
