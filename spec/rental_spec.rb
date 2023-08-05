require_relative '../lib/domain/rental'
require_relative '../lib/domain/book'
require_relative '../lib/domain/person'

RSpec.describe Rental do
  let(:book) { Book.new('Ruby Programming', 'Ruby Guy') }
  let(:person) { Person.new('John', 25) }
  let(:rental_date) { Date.new(2023, 1, 1) }
  let(:rental) { Rental.new(rental_date, book, person) }

  describe '#initialize' do
    it 'sets the correct values' do
      expect(rental.date).to eq(rental_date)
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
    end

    it 'generates a random ID if no ID is provided' do
      expect(rental.instance_variable_get(:@id)).to be_a(Integer)
    end

    it 'uses the provided ID if available' do
      rental_with_id = Rental.new(rental_date, book, person, id: 12_345)
      expect(rental_with_id.instance_variable_get(:@id)).to eq(12_345)
    end

    it 'adds the rental to the book' do
      expect(book.rentals).to include(rental)
    end

    it 'adds the rental to the person' do
      expect(person.rentals).to include(rental)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the rental' do
      expected_hash = {
        id: rental.instance_variable_get(:@id),
        date: rental_date,
        book: book.to_h,
        person: person.to_h
      }
      expect(rental.to_h).to eq(expected_hash)
    end
  end
end
