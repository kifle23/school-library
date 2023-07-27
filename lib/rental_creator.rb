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
    puts 'Available books:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title:\"#{book.title}\", Author:#{book.author}"
    end

    print 'Select a book (by index): '
    book_index = gets.chomp.to_i
    book = @books[book_index]

    unless book
      puts 'Invalid book index.'
      return
    end

    puts 'Available people:'
    @people.each_with_index do |person, index|
      if person.is_a?(Student)
        puts "#{index}) [Student] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "#{index}) [Teacher] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      else
        puts "#{index}) Unknown person type"
      end
    end

    print 'Select a person (by index): '
    person_index = gets.chomp.to_i
    person = @people[person_index]

    unless person
      puts 'Invalid person index.'
      return
    end

    print 'Rental date (yyyy-mm-dd): '
    rental_date = gets.chomp
    rental = Rental.new(rental_date, book, person)
    @rentals << rental

    puts "Created rental for '#{book.title}' by #{book.author} on #{rental_date}, for #{person.name} (id: #{person.id})."
  end
end