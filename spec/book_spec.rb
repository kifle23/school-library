require_relative '../lib/domain/book'
require_relative '../lib/domain/rental'
require_relative '../lib/domain/student'
require 'date'

describe Book do
  let(:title) { 'Ruby Programming' }
  let(:author) { 'The Ruby Guy' }
  let(:book) { Book.new(title, author) }

  describe '#initialize' do
    it 'sets the title and author' do
      expect(book.title).to eq(title)
      expect(book.author).to eq(author)
    end

    it 'generates a random ID if not provided' do
      expect(book.instance_variable_get(:@id)).to be_an(Integer)
    end

    it 'uses the provided ID if provided' do
      id = 12_345
      book_with_id = Book.new(title, author, id: id)
      expect(book_with_id.instance_variable_get(:@id)).to eq(id)
    end

    it 'initializes rentals as an empty array' do
      expect(book.rentals).to be_an(Array)
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    let(:person) { Student.new('Jake', 20, 'Math') }
    let(:date) { Date.today }

    it 'creates a new rental and adds it to the rentals array' do
      expect(person).to receive(:add_rental)
      book.add_rental(person, date)
      expect(book.rentals.length).to eq(2)
      expect(book.rentals.first).to be_an_instance_of(Rental)
    end
  end

  describe '#to_h' do
    it 'returns a hash representation of the book object' do
      expected_hash = {
        id: book.instance_variable_get(:@id),
        title: title,
        author: author
      }
      expect(book.to_h).to eq(expected_hash)
    end
  end
end
