require_relative '../lib/domain/person'
require_relative '../lib/domain/student'
require_relative '../lib/domain/class_room'

describe Student do
  let(:student) { Student.new('John', 15, 'Math Class') }

  describe '#initialize' do
    it 'sets the correct default values' do
      expect(student.name).to eq('John')
      expect(student.age).to eq(15)
      expect(student.parent_permission).to eq(true)
      expect(student.classroom).to eq('Math Class')
    end

    it 'inherits from the Person class' do
      expect(student).to be_a(Person)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the student' do
      expected_hash = {
        type: 'Student',
        id: student.id,
        name: 'John',
        age: 15,
        parent_permission: true,
        classroom: 'Math Class'
      }
      expect(student.to_h).to eq(expected_hash)
    end
  end

  describe '#play_hooky' do
    it 'returns the play hooky message' do
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#enroll_in_classroom' do
    let(:classroom) { Classroom.new('Math Class') }

    it 'sets the student\'s classroom' do
      student.enroll_in_classroom(classroom)
      expect(student.classroom).to eq(classroom)
    end

    it 'calls add_student on the classroom' do
      expect(classroom).to receive(:add_student).with(student)
      student.enroll_in_classroom(classroom)
    end
  end
end
