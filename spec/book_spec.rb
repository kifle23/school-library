require_relative '../lib/book'
require_relative '../lib/student'

describe Book do
  let(:book) { Book.new('Title', 'Author') }
  let(:person) { Student.new(23, 'class', name: 'yash') }

  describe '#initialize' do
    it 'sets title and author attributes' do
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end

    it 'initializes rentals as an empty array' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'creates a new rental and adds it to rentals' do
      date = '2023-08-01'
      book.add_rental(date, person)
      expect(book.rentals).not_to be_empty
      expect(book.rentals).to include(Rental.new(date, book, person))
    end
  end

  describe '#to_h' do
    it 'returns a hash with title and author' do
      expect(book.to_h).to eq({ title: 'Title', author: 'Author' })
    end
  end
end
