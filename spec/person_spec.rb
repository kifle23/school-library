require_relative '../lib/decorators/nameable'
require_relative '../lib/domain/person'

describe Person do
  let(:person) { Person.new('John', 25) }
  let(:rental_date) { Date.today }

  describe '#initialize' do
    it 'sets the correct default values' do
      expect(person.name).to eq('John')
      expect(person.age).to eq(25)
      expect(person.parent_permission).to eq(true)
      expect(person.rentals).to be_empty
      expect(person.id).to be > 0
    end

    it 'sets the specified values' do
      person = Person.new('Jane', 30, parent_permission: false, id: 123)
      expect(person.name).to eq('Jane')
      expect(person.age).to eq(30)
      expect(person.parent_permission).to eq(false)
      expect(person.rentals).to be_empty
      expect(person.id).to eq(123)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the person' do
      expected_hash = {
        id: person.id,
        name: 'John',
        age: 25,
        parent_permission: true
      }
      expect(person.to_h).to eq(expected_hash)
    end
  end

  describe '#correct_name' do
    it 'returns the name of the person' do
      expect(person.correct_name).to eq('John')
    end
  end

  describe '#of_age?' do
    it 'returns true if the person is 18 years or older' do
      expect(person.send(:of_age?)).to be(true)
    end

    it 'returns false if the person is under 18 years old' do
      person = Person.new('Bob', 16)
      expect(person.send(:of_age?)).to be(false)
    end
  end

  describe '#can_use_services?' do
    it 'returns true if the person is of age' do
      person = Person.new('Alice', 20)
      expect(person.can_use_services?).to be(true)
    end

    it 'returns true if the person has parent permission' do
      person = Person.new('Bob', 16)
      expect(person.can_use_services?).to be(true)
    end

    it 'returns false if the person is under 18 years old and has no parent permission' do
      person = Person.new('Charlie', 16, parent_permission: false)
      expect(person.can_use_services?).to be(false)
    end
  end

  describe '#add_rental' do
    let(:other_person) { Person.new('Jane', 30) }
    let(:rental) { double('Rental') }

    it 'calls add_rental on the other person' do
      expect(Rental).to receive(:new).and_return(rental)
      expect(other_person).to receive(:add_rental).with(rental)
      person.add_rental(other_person, rental_date)
    end
  end
end
