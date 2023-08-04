require_relative '../lib/person'
require_relative '../lib/teacher'

describe Teacher do
  context '#initialize' do
    it 'creates a teacher with a specialization, age, and defaults' do
      teacher = Teacher.new('Math', 35)
      expect(teacher.specialization).to eq('Math')
      expect(teacher.age).to eq(35)
      expect(teacher.parent_permission).to eq(true)
      expect(teacher.name).to eq('Unknown')
      expect(teacher.id).to be_between(1000, 10_000)
    end

    it 'creates a teacher with given name and parent permission' do
      teacher = Teacher.new('Science', 30, name: 'Bob', parent_permission: false)
      expect(teacher.name).to eq('Bob')
      expect(teacher.parent_permission).to eq(false)
    end
  end

  context '#can_use_services?' do
    it 'returns true' do
      teacher = Teacher.new('Art', 40)
      expect(teacher.can_use_services?).to eq(true)
    end
  end

  context '#to_h' do
    it 'returns a hash representation of the teacher' do
      teacher = Teacher.new('English', 45, name: 'Alice')
      teacherhash = {
        type: 'Teacher',
        id: teacher.id,
        name: 'Alice',
        age: 45,
        specialization: 'English'
      }
      expect(teacher.to_h).to eq(teacherhash)
    end
  end
end
