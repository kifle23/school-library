require_relative 'rental'
require_relative 'book'
require_relative 'person'

class RentalCreator
  def initialize(books, people, rentals)
    @books = books
    @people = people
    @rentals = rentals
  end

  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }
    book_id = gets.chomp.to_i

    puts 'Select a person from the following list by number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] [#{person.class}] Name: #{person.name}, Id: #{person.id}, Age: #{person.age}"
    end
    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_id], @people[person_id])
    @rentals << rental
    puts 'created a rental.'
  end
end
