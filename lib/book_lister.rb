require_relative 'book'

class BookLister
  def initialize(books)
    @books = books
  end

  def list_all_books
    if @books.empty?
      puts 'There are no books in your library'
    else
      @books.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
    end
  end
end
