require_relative '../domain/book'

class BookLister
  def initialize(books)
    @books = books
  end

  def list_all_books
    puts 'All books:'
    if @books.empty?
      puts 'No books available.'
    else
      @books.each do |book|
        puts "Title:\"#{book.title}\", Author:#{book.author}"
      end
    end
  end
end
