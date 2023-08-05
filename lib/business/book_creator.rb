require_relative '../domain/book'
# The BookCreator class is responsible for creating new Book objects.
class BookCreator
  def initialize(books)
    @books = books
  end

  def create_book
    title = read_book_title_from_user_input
    author = read_book_author_from_user_input

    return if book_already_exists(title, author)

    book = create_new_book(title, author)
    puts "Created book '#{book.title}' by #{book.author}."
  rescue ArgumentError => e
    puts "Error: #{e.message}"
  end

  def read_book_title_from_user_input
    print 'Title: '
    gets.chomp
  end

  def read_book_author_from_user_input
    print 'Author: '
    gets.chomp
  end

  def book_already_exists(title, author)
    if @books.any? { |book| book.title == title && book.author == author }
      print 'A book with that title and author already exists. Create anyway? (y/n): '
      create_anyway = gets.chomp.downcase == 'y'
      return true unless create_anyway
    end
    false
  end

  def create_new_book(title, author)
    book = Book.new(title, author)
    @books << book
    book
  end
end
