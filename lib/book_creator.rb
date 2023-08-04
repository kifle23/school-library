require_relative 'book'
class BookCreator
  def initialize(books)
    @books = books
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Enter the Author name: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created successfully'
  end
end
