require_relative '../lib/student'
require_relative '../lib/class_room'

describe Student do
  let(:classroom) { double('Classroom') }

  describe '#initialize' do
    it 'sets default values and assigns classroom' do
      student = Student.new(15, classroom)

      expect(student.id).to be_a(Integer)
      expect(student.name).to eq('Unknown')
      expect(student.parent_permission).to be true
      expect(student.age).to eq(15)
      expect(student.classroom).to eq(classroom)
    end

    it 'allows overriding default values' do
      student = Student.new(16, classroom, name: 'Alice', parent_permission: false)

      expect(student.name).to eq('Alice')
      expect(student.parent_permission).to be false
    end
  end

  describe '#classroom=' do
    it 'sets classroom and adds student to classroom' do
      student = Student.new(17, classroom)
      new_classroom = Classroom.new('class 1')
      student.classroom = new_classroom
      expect(new_classroom.students).to include(student)
    end
  end

  describe '#play_hooky' do
    it 'returns a play hooky message' do
      student = Student.new(18, classroom)
      expect(student.play_hooky).to eq('¯\\(ツ)/¯')
    end
  end

  describe '#to_h' do
    it 'returns a hash with student details' do
      student = Student.new(19, classroom, name: 'Bob', parent_permission: true)

      hash = {
        type: 'Student',
        id: student.id,
        name: 'Bob',
        age: 19,
        parent_permission: true,
        classroom: classroom
      }

      expect(student.to_h).to eq(hash)
    end
  end
end
