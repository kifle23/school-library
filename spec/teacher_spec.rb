require_relative '../lib/domain/person'
require_relative '../lib/domain/teacher'

describe Teacher do
  let(:teacher) { Teacher.new('Jane', 35, 'Mathematics') }

  describe '#initialize' do
    it 'sets the correct values' do
      expect(teacher.name).to eq('Jane')
      expect(teacher.age).to eq(35)
      expect(teacher.specialization).to eq('Mathematics')
    end

    it 'inherits from the Person class' do
      expect(teacher).to be_a(Person)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the teacher' do
      expected_hash = {
        type: 'Teacher',
        id: teacher.id,
        name: 'Jane',
        age: 35,
        specialization: 'Mathematics'
      }
      expect(teacher.to_h).to eq(expected_hash)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
