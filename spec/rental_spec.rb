require_relative '../lib/rental'
require_relative '../lib/book'
require_relative '../lib/person'

describe Rental do
  describe '#initialize' do
    it 'creates a rental with a date, book, and person' do
      book = Book.new('Ruby Programming', 'Ruby Guy')
      person = Person.new(25, name: 'Jane')
      rental = Rental.new('2022-07-01', book, person)
      expect(rental.date).to eq('2022-07-01')
      expect(rental.book).to eq(book)
      expect(rental.person).to eq(person)
      expect(book.rentals).to eq([rental])
      expect(person.rentals).to eq([rental])
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the rental' do
      book = Book.new('Ruby Programming ed 2', 'The Same Guy')
      person = Person.new(30, name: 'Tom')
      rental = Rental.new('2022-08-01', book, person)
      expect(rental.to_h).to eq({
                                  date: '2022-08-01',
                                  book: book.to_h,
                                  person: person.to_h
                                })
    end
  end
end
