require_relative 'book'
class BookCreator
  def initialize(books)
    @books = books
  end

  def create_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    if @books.any? { |book| book.title == title && book.author == author }
      print 'A book with that title and author already exists. Create anyway? (y/n): '
      create_anyway = gets.chomp.downcase == 'y'
      return unless create_anyway
    end

    book = Book.new(title, author)
    @books << book
    puts "Created book '#{book.title}' by #{book.author}."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end
end