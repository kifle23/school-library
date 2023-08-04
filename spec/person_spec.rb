require_relative '../lib/person'
require_relative '../lib/book'

describe Person do
  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        person = Person.new(18)
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is under 18 but has parent permission' do
      it 'returns true' do
        person = Person.new(16, parent_permission: true)
        expect(person.can_use_services?).to be true
      end
    end

    context 'when the person is under 18 and does not have parent permission' do
      it 'returns false' do
        person = Person.new(16, parent_permission: false)
        expect(person.can_use_services?).to be false
      end
    end
  end

  describe '#add_rental' do
    it 'creates a new rental with the person as the renter' do
      person = Person.new(25)
      book = Book.new('title', 'author')
      rental = person.add_rental('2023-08-02', book)
      expect(rental).to be_a(Rental)
      expect(person.rentals).to include(Rental.new('2023-08-02', book, person))
    end
  end

  describe '#to_h' do
    it 'return hash withd details' do
      person = Person.new(25, name: 'John', parent_permission: false)
      hash = { id: person.id, age: 25, name: 'John', parent_permission: false }
      expect(person.to_h).to eq(hash)
    end
  end
end
